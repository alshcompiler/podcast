import Foundation

protocol NetworkManagerProtocol {
    func request<T: Codable>(_ endpoint: any APIEndpointProtocol) async throws -> T
}

class NetworkManager: NetworkManagerProtocol {
    func request<T: Codable>(_ endpoint: any APIEndpointProtocol) async throws -> T {
        // Create URLRequest with all endpoint properties
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        
        // Add headers
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        // Add parameters (for GET requests, add to URL; for POST, add to body)
        if let parameters = endpoint.parameters {
            if endpoint.method == .GET {
                // Add parameters to URL for GET requests
                var urlComponents = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: false)!
                urlComponents.queryItems = parameters.map { key, value in
                    URLQueryItem(name: key, value: "\(value)")
                }
                request.url = urlComponents.url
            } else {
                // Add parameters to body for POST/PUT requests
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            }
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
} 
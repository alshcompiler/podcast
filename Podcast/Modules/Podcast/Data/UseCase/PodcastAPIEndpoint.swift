import Foundation

protocol APIEndpointProtocol {
    var method: HTTPMethod { get }
    var url: URL { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

enum PodcastAPIEndpoint: APIEndpointProtocol {
    case getPodcastSections
    
    var method: HTTPMethod {
        switch self {
        case .getPodcastSections:
            return .GET
        }
    }
    
    var url: URL {
        let baseURL = "https://api-v2-b2sit6oh3a-uc.a.run.app"
        switch self {
        case .getPodcastSections:
            return URL(string: "\(baseURL)/home_sections")!
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getPodcastSections:
            return nil
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
} 
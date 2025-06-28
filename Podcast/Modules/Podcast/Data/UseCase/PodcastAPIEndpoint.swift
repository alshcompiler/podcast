import Foundation

protocol APIEndpointProtocol {
    var method: HTTPMethod { get }
    var url: URL { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

enum PodcastAPIEndpoint: APIEndpointProtocol {
    case getPodcastSections(page: Int?)
    case searchPodcastSections(query: String)
    
    var method: HTTPMethod {
        switch self {
        case .getPodcastSections, .searchPodcastSections:
            return .GET
        }
    }
    
    var url: URL {
        let baseURL = "https://api-v2-b2sit6oh3a-uc.a.run.app"
        switch self {
        case .getPodcastSections(let page):
            var urlString = "\(baseURL)/home_sections"
            if let page = page {
                urlString += "?page=\(page)"
            }
            return URL(string: urlString)!
        case .searchPodcastSections(let query):
            let urlString = "https://mock.apidog.com/m1/735111-711675-default/search?q=\(query)"
            return URL(string: urlString)!
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getPodcastSections, .searchPodcastSections:
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
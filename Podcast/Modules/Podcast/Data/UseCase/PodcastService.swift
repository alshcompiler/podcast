import Foundation

protocol PodcastServiceProtocol {
    func fetchPodcastSections() async throws -> [PodcastSection]
    func fetchPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo)
}

class PodcastService: PodcastServiceProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPodcastSections() async throws -> [PodcastSection] {
        let endpoint = PodcastAPIEndpoint.getPodcastSections(page: nil)
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return response.sections
    }
    
    func fetchPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo) {
        let endpoint = PodcastAPIEndpoint.getPodcastSections(page: page)
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return (sections: response.sections, pagination: response.pagination)
    }
}

private struct PodcastSectionsRoot: Codable {
    let sections: [PodcastSection]
    let pagination: PaginationInfo
} 

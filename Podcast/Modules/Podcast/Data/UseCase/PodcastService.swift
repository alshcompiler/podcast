import Foundation

protocol PodcastServiceProtocol {
    func fetchPodcastSections() async throws -> [PodcastSection]
    func fetchPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo)
    func fetchPodcastSearchSections(query: String) async throws -> [PodcastSection]
}

class PodcastService: PodcastServiceProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPodcastSections() async throws -> [PodcastSection] {
        let endpoint = PodcastAPIEndpoint.getPodcastSections(page: nil)
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return response.sections ?? []
    }
    
    func fetchPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo) {
        let endpoint = PodcastAPIEndpoint.getPodcastSections(page: page)
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return (sections: response.sections ?? [], pagination: response.pagination ?? .empty)
    }
    
    func fetchPodcastSearchSections(query: String) async throws -> [PodcastSection] {
        let endpoint = PodcastAPIEndpoint.searchPodcastSections(query: query)
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return response.sections ?? []
    }
}

private struct PodcastSectionsRoot: Codable {
    let sections: [PodcastSection]?
    let pagination: PaginationInfo?
}

private extension PaginationInfo {
    static let empty: Self = .init(next_page: nil, total_pages: 1)
}

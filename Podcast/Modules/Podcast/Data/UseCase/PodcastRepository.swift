import Foundation

protocol PodcastRepositoryProtocol {
    func getPodcastSections() async throws -> [PodcastSection]
    func getPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo)
}

class PodcastRepository: PodcastRepositoryProtocol {
    private let apiService: PodcastServiceProtocol

    init(apiService: PodcastServiceProtocol = PodcastService()) {
        self.apiService = apiService
    }

    func getPodcastSections() async throws -> [PodcastSection] {
        try await apiService.fetchPodcastSections()
    }
    
    func getPodcastSectionsWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo) {
        try await apiService.fetchPodcastSectionsWithPagination(page: page)
    }
} 

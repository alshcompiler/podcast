import Foundation

protocol PodcastRepositoryProtocol {
    func getPodcastSections() async throws -> [PodcastSection]
}

class PodcastRepository: PodcastRepositoryProtocol {
    private let apiService: PodcastServiceProtocol

    init(apiService: PodcastServiceProtocol = PodcastService()) {
        self.apiService = apiService
    }

    func getPodcastSections() async throws -> [PodcastSection] {
        try await apiService.fetchPodcastSections()
    }
} 

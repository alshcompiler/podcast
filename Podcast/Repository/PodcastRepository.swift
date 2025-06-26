import Foundation

protocol PodcastRepositoryProtocol {
    func getPodcastSections() async throws -> [PodcastSection]
}

class PodcastRepository: PodcastRepositoryProtocol {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func getPodcastSections() async throws -> [PodcastSection] {
        try await apiService.fetchPodcastSections()
    }
} 

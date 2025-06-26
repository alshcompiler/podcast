import Foundation

class FetchPodcastSectionsUseCase {
    private let repository: PodcastRepositoryProtocol

    init(repository: PodcastRepositoryProtocol = PodcastRepository()) {
        self.repository = repository
    }

    func execute() async throws -> [PodcastSection] {
        try await repository.getPodcastSections()
    }
} 

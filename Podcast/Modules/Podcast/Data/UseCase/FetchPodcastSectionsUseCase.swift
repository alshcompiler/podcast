import Foundation

class FetchPodcastSectionsUseCase {
    private let repository: PodcastRepositoryProtocol

    init(repository: PodcastRepositoryProtocol = PodcastRepository()) {
        self.repository = repository
    }

    func execute() async throws -> [PodcastSection] {
        try await repository.getPodcastSections()
    }
    
    func executeWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo) {
        try await repository.getPodcastSectionsWithPagination(page: page)
    }
} 

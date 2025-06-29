import Foundation

protocol FetchPodcastSectionsUseCaseProtocol {
    func execute() async throws -> [PodcastSection]
    func executeWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo)
    func executeSearch(query: String) async throws -> [PodcastSection]
}

class FetchPodcastSectionsUseCase: FetchPodcastSectionsUseCaseProtocol {
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

    func executeSearch(query: String) async throws -> [PodcastSection] {
        try await repository.getPodcastSearchSections(query: query)
    }
} 

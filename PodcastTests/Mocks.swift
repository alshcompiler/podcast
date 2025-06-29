import Foundation
@testable import Podcast

class MockFetchPodcastSectionsUseCase: FetchPodcastSectionsUseCaseProtocol {
    // For pagination
    var sectionsResult: (sections: [PodcastSection], pagination: PaginationInfo)?
    // For search
    var searchResult: [PodcastSection] = []
    // For error simulation
    var error: Error?
    // For tracking calls
    var executeWithPaginationCalledPages: [Int] = []
    var lastQuery: String?

    func execute() async throws -> [PodcastSection] { return [] }
    func executeWithPagination(page: Int?) async throws -> (sections: [PodcastSection], pagination: PaginationInfo) {
        executeWithPaginationCalledPages.append(page ?? 1)
        if let error = error { throw error }
        return sectionsResult ?? ([], .init(next_page: nil, total_pages: 1))
    }
    func executeSearch(query: String) async throws -> [PodcastSection] {
        lastQuery = query
        if let error = error { throw error }
        return searchResult
    }
} 
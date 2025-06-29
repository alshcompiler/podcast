//
//  PodcastSearchViewModelTests.swift
//  PodcastTests
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import Testing
@testable import Podcast

@MainActor
struct PodcastSearchViewModelTests {
    @Test func testPerformSearchSuccess() async throws {
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        mockUseCase.searchResult = [.mockSquare]
        let viewModel = PodcastSearchViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        viewModel.performSearch(query: "test")
        try? await Task.sleep(nanoseconds: 200_000_000)
        #expect(viewModel.mediaSections.count == 1)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage == nil)
        #expect(mockUseCase.lastQuery == "test")
    }

    @Test func testPerformSearchError() async throws {
        struct DummyError: Error {}
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        mockUseCase.error = DummyError()
        let viewModel = PodcastSearchViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        viewModel.performSearch(query: "fail")
        try? await Task.sleep(nanoseconds: 200_000_000)
        #expect(viewModel.mediaSections.isEmpty)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage != nil)
    }

    @Test func testPerformSearchEmptyQuery() async throws {
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        let viewModel = PodcastSearchViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        viewModel.performSearch(query: "")
        #expect(viewModel.mediaSections.isEmpty)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage == nil)
    }
}

private extension PodcastSection {
    static let mockSquare = PodcastSection(name: "Featured", type: "square", content_type: nil, order: 1, rawOrder: nil, content: [.mockPodcast])
}

private extension Podcast {
    static let mockPodcast = Podcast(
        podcast_id: "1",
        name: "Test Podcast",
        description: nil,
        avatar_url: "url",
        episode_count: nil,
        rawEpisodeCount: nil,
        duration: 60,
        rawDuration: nil,
        language: nil,
        priority: nil,
        rawPriority: nil,
        popularityScore: nil,
        rawPopularityScore: nil,
        score: nil,
        rawScore: nil,
        release_date: "2024-01-01"
    )
} 

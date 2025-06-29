//
//  PodcastHomeViewModelTests.swift
//  PodcastTests
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import Testing
@testable import Podcast


@MainActor
struct PodcastHomeViewModelTests {
    @Test func testFetchSectionsSuccess() async throws {
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        mockUseCase.sectionsResult = ([.mockSquare], .init(next_page: nil, total_pages: 1))
        let viewModel = PodcastHomeViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        await viewModel.fetchSections()
        #expect(viewModel.mediaSections.count == 1)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage == nil)
    }

    @Test func testFetchSectionsError() async throws {
        struct DummyError: Error {}
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        mockUseCase.error = DummyError()
        let viewModel = PodcastHomeViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        await viewModel.fetchSections()
        #expect(viewModel.mediaSections.isEmpty)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage != nil)
    }

    @Test func testPaginationLoadsMoreSections() async throws {
        let mockUseCase = MockFetchPodcastSectionsUseCase()
        mockUseCase.sectionsResult = ([.mockSquare], .init(next_page: "2", total_pages: 2))
        let viewModel = PodcastHomeViewModel(fetchPodcastSectionsUseCase: mockUseCase)
        await viewModel.fetchSections()
        // Simulate load more
        mockUseCase.sectionsResult = ([.mockTwoLineGrid], .init(next_page: nil, total_pages: 2))
        viewModel.checkAndLoadMore(currentSection: viewModel.mediaSections.last!)
        // Wait for async Task to finish
        try? await Task.sleep(nanoseconds: 200_000_000)
        #expect(viewModel.mediaSections.count == 2)
        #expect(mockUseCase.executeWithPaginationCalledPages == [1, 2])
    }
}

private extension PodcastSection {
    static let mockSquare = PodcastSection(name: "Featured", type: "square", content_type: nil, order: 1, rawOrder: nil, content: [.mockPodcast])
    static let mockTwoLineGrid = PodcastSection(name: "Grid", type: "2_lines_grid", content_type: nil, order: 2, rawOrder: nil, content: [.mockPodcast2, .mockPodcast2])
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
    static let mockPodcast2 = Podcast(
        podcast_id: "2",
        name: "Grid Podcast",
        description: nil,
        avatar_url: "url2",
        episode_count: nil,
        rawEpisodeCount: nil,
        duration: 120,
        rawDuration: nil,
        language: nil,
        priority: nil,
        rawPriority: nil,
        popularityScore: nil,
        rawPopularityScore: nil,
        score: nil,
        rawScore: nil,
        release_date: "2024-01-02"
    )
} 

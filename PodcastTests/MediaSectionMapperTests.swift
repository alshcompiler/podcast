//
//  MediaSectionMapperTests.swift
//  PodcastTests
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import Testing
@testable import Podcast

struct MediaSectionMapperTests {

    @Test func testMapSquareSection() async throws {
        let section = PodcastSection.mockSquare
        let result = MediaSectionMapper.map(sections: [section])
        #expect(result.count == 1)
        if case let .square(name, items) = result.first! {
            #expect(name == "Featured")
            #expect(items.count == 1)
            #expect(items.first?.title == "Test Podcast")
        } else {
            #expect(Bool(false), "Expected .square section")
        }
    }

    @Test func testMapTwoLineGridSection() async throws {
        let section = PodcastSection.mockTwoLineGrid
        let result = MediaSectionMapper.map(sections: [section])
        #expect(result.count == 1)
        if case let .twoLineGrid(name, arrays) = result.first! {
            #expect(name == "Grid")
            #expect(arrays.count == 1)
            #expect(arrays.first?.count == 2)
        } else {
            #expect(Bool(false), "Expected .twoLineGrid section")
        }
    }

    @Test func testMapBigSquareSection() async throws {
        let section = PodcastSection.mockBigSquare
        let result = MediaSectionMapper.map(sections: [section])
        #expect(result.count == 1)
        if case let .bigSquare(name, items) = result.first! {
            #expect(name == "Big")
            #expect(items.count == 1)
            #expect(items.first?.title == "Big Podcast")
        } else {
            #expect(Bool(false), "Expected .bigSquare section")
        }
    }

    @Test func testMapQueueSection() async throws {
        let section = PodcastSection.mockQueue
        let result = MediaSectionMapper.map(sections: [section])
        #expect(result.count == 1)
        if case let .queue(name, items) = result.first! {
            #expect(name == "Queue")
            #expect(items.count == 1)
            #expect(items.first?.title == "Queue Podcast")
        } else {
            #expect(Bool(false), "Expected .queue section")
        }
    }

    @Test func testMapSectionWithNilTypeOrName() async throws {
        let result = MediaSectionMapper.map(sections: [.mockNilType, .mockNilName])
        #expect(result.isEmpty)
    }

    @Test func testMapSectionsAreSortedByOrder() async throws {
        let result = MediaSectionMapper.map(sections: [.mockOrder1, .mockOrder2, .mockOrder3])
        #expect(result.count == 3)
        let names = result.map {
            switch $0 {
            case .square(let name, _): return name
            case .queue(let name, _): return name
            case .bigSquare(let name, _): return name
            case .twoLineGrid(let name, _): return name
            }
        }
        #expect(names == ["Second", "First", "Third"])
    }

    @Test func testTwoLineGridOddCount() async throws {
        let section = PodcastSection.mockTwoLineGridOddCount()
        let result = MediaSectionMapper.map(sections: [section])
        #expect(result.count == 1)
        if case let .twoLineGrid(_, arrays) = result.first! {
            #expect(arrays.count == 2)
            #expect(arrays[0].count == 2)
            #expect(arrays[1].count == 1)
            #expect(arrays[1][0].title == "Big Podcast")
        } else {
            #expect(Bool(false), "Expected .twoLineGrid section")
        }
    }
}

private extension Podcast {
    // Static mocks for reuse
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
    static let mockPodcast3 = Podcast(
        podcast_id: "3",
        name: "Big Podcast",
        description: nil,
        avatar_url: "url3",
        episode_count: nil,
        rawEpisodeCount: nil,
        duration: 180,
        rawDuration: nil,
        language: nil,
        priority: nil,
        rawPriority: nil,
        popularityScore: nil,
        rawPopularityScore: nil,
        score: nil,
        rawScore: nil,
        release_date: "2024-01-03"
    )
    static let mockPodcast4 = Podcast(
        podcast_id: "4",
        name: "Queue Podcast",
        description: nil,
        avatar_url: "url4",
        episode_count: nil,
        rawEpisodeCount: nil,
        duration: 240,
        rawDuration: nil,
        language: nil,
        priority: nil,
        rawPriority: nil,
        popularityScore: nil,
        rawPopularityScore: nil,
        score: nil,
        rawScore: nil,
        release_date: "2024-01-04"
    )
    static let mockPodcast5 = Podcast(
        podcast_id: "5",
        name: "Nil Podcast",
        description: nil,
        avatar_url: "url5",
        episode_count: nil,
        rawEpisodeCount: nil,
        duration: 300,
        rawDuration: nil,
        language: nil,
        priority: nil,
        rawPriority: nil,
        popularityScore: nil,
        rawPopularityScore: nil,
        score: nil,
        rawScore: nil,
        release_date: "2024-01-05"
    )
}

private extension PodcastSection {
    static let mockSquare = PodcastSection(name: "Featured", type: "square", content_type: nil, order: 1, rawOrder: nil, content: [.mockPodcast])
    static let mockTwoLineGrid = PodcastSection(name: "Grid", type: "2_lines_grid", content_type: nil, order: 2, rawOrder: nil, content: [.mockPodcast2, .mockPodcast2])
    static let mockBigSquare = PodcastSection(name: "Big", type: "big_square", content_type: nil, order: 3, rawOrder: nil, content: [.mockPodcast3])
    static let mockQueue = PodcastSection(name: "Queue", type: "queue", content_type: nil, order: 4, rawOrder: nil, content: [.mockPodcast4])
    static let mockNilType = PodcastSection(name: "NoType", type: nil, content_type: nil, order: 5, rawOrder: nil, content: [.mockPodcast5])
    static let mockNilName = PodcastSection(name: nil, type: "square", content_type: nil, order: 6, rawOrder: nil, content: [.mockPodcast5])
    static let mockOrder1 = PodcastSection(name: "First", type: "square", content_type: nil, order: 2, rawOrder: nil, content: [.mockPodcast])
    static let mockOrder2 = PodcastSection(name: "Second", type: "queue", content_type: nil, order: 1, rawOrder: nil, content: [.mockPodcast])
    static let mockOrder3 = PodcastSection(name: "Third", type: "big_square", content_type: nil, order: 3, rawOrder: nil, content: [.mockPodcast])
    static func mockTwoLineGridOddCount() -> PodcastSection {
        PodcastSection(name: "Grid", type: "2_lines_grid", content_type: nil, order: 1, rawOrder: nil, content: [.mockPodcast, .mockPodcast2, .mockPodcast3])
    }
}

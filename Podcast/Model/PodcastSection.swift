import Foundation

struct PodcastSection: Codable, Identifiable {
    var id: String { name ?? "" }
    let name: String?
    let type: String?
    let content_type: String?
    let order: Int?
    let content: [Podcast]?
}

struct Podcast: Codable, Identifiable {
    let podcast_id: String?
    var id: String { podcast_id ?? "" }
    let name: String?
    let description: String?
    let avatar_url: String?
    let episode_count: Int?
    let duration: Int?
    let language: String?
    let priority: Int?
    let popularityScore: Int?
    let score: Double?
    let release_date: String?
}

struct PaginationInfo: Codable {
    let next_page: String?
    let total_pages: Int
}

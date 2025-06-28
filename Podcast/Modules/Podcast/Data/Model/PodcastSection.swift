import Foundation

struct PodcastSection: Codable, Identifiable {
    var id: String { name ?? "" }
    let name: String?
    let type: String?
    let content_type: String?
    let order: Int?
    let rawOrder: String?
    let content: [Podcast]?

    private enum CodingKeys: String, CodingKey {
        case name, type, content_type, order, content
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        content_type = try container.decodeIfPresent(String.self, forKey: .content_type)
        // Accept Int or String for order, store both
        if let intOrder = try? container.decodeIfPresent(Int.self, forKey: .order) {
            order = intOrder
            rawOrder = String(intOrder)
        } else if let strOrder = try? container.decodeIfPresent(String.self, forKey: .order) {
            rawOrder = strOrder
            order = Int(strOrder)
        } else {
            order = nil
            rawOrder = nil
        }
        content = try container.decodeIfPresent([Podcast].self, forKey: .content)
    }
}

struct Podcast: Codable, Identifiable {
    let podcast_id: String?
    var id: String { podcast_id ?? "" }
    let name: String?
    let description: String?
    let avatar_url: String?
    let episode_count: Int?
    let rawEpisodeCount: String?
    let duration: Int?
    let rawDuration: String?
    let language: String?
    let priority: Int?
    let rawPriority: String?
    let popularityScore: Int?
    let rawPopularityScore: String?
    let score: Double?
    let rawScore: String?
    let release_date: String?

    private enum CodingKeys: String, CodingKey {
        case podcast_id, name, description, avatar_url, episode_count, duration, language, priority, popularityScore, score, release_date
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        podcast_id = try container.decodeIfPresent(String.self, forKey: .podcast_id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        avatar_url = try container.decodeIfPresent(String.self, forKey: .avatar_url)
        // episode_count: Int or String
        if let intCount = try? container.decodeIfPresent(Int.self, forKey: .episode_count) {
            episode_count = intCount
            rawEpisodeCount = String(intCount)
        } else if let strCount = try? container.decodeIfPresent(String.self, forKey: .episode_count) {
            rawEpisodeCount = strCount
            episode_count = Int(strCount)
        } else {
            episode_count = nil
            rawEpisodeCount = nil
        }
        // duration: Int or String
        if let intDuration = try? container.decodeIfPresent(Int.self, forKey: .duration) {
            duration = intDuration
            rawDuration = String(intDuration)
        } else if let strDuration = try? container.decodeIfPresent(String.self, forKey: .duration) {
            rawDuration = strDuration
            duration = Int(strDuration)
        } else {
            duration = nil
            rawDuration = nil
        }
        // priority: Int or String
        if let intPriority = try? container.decodeIfPresent(Int.self, forKey: .priority) {
            priority = intPriority
            rawPriority = String(intPriority)
        } else if let strPriority = try? container.decodeIfPresent(String.self, forKey: .priority) {
            rawPriority = strPriority
            priority = Int(strPriority)
        } else {
            priority = nil
            rawPriority = nil
        }
        // popularityScore: Int or String
        if let intPopularity = try? container.decodeIfPresent(Int.self, forKey: .popularityScore) {
            popularityScore = intPopularity
            rawPopularityScore = String(intPopularity)
        } else if let strPopularity = try? container.decodeIfPresent(String.self, forKey: .popularityScore) {
            rawPopularityScore = strPopularity
            popularityScore = Int(strPopularity)
        } else {
            popularityScore = nil
            rawPopularityScore = nil
        }
        // score: Double or String
        if let doubleScore = try? container.decodeIfPresent(Double.self, forKey: .score) {
            score = doubleScore
            rawScore = String(doubleScore)
        } else if let strScore = try? container.decodeIfPresent(String.self, forKey: .score) {
            rawScore = strScore
            score = Double(strScore)
        } else {
            score = nil
            rawScore = nil
        }
        language = try container.decodeIfPresent(String.self, forKey: .language)
        release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
    }
}

struct PaginationInfo: Codable {
    let next_page: String?
    let total_pages: Int
} 
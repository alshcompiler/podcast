import Foundation

protocol APIServiceProtocol {
    func fetchPodcastSections() async throws -> [PodcastSection]
}

class APIService: APIServiceProtocol {
    private let baseURL = URL(string: "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections")!
    
    func fetchPodcastSections() async throws -> [PodcastSection] {
        let (data, _) = try await URLSession.shared.data(from: baseURL)
        let root = try JSONDecoder().decode(PodcastSectionsRoot.self, from: data)
        return root.sections
    }
}

private struct PodcastSectionsRoot: Codable {
    let sections: [PodcastSection]
} 
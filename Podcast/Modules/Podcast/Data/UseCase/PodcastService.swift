import Foundation

protocol PodcastServiceProtocol {
    func fetchPodcastSections() async throws -> [PodcastSection]
}

class PodcastService: PodcastServiceProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPodcastSections() async throws -> [PodcastSection] {
        let endpoint = PodcastAPIEndpoint.getPodcastSections
        let response: PodcastSectionsRoot = try await networkManager.request(endpoint)
        return response.sections
    }
}

private struct PodcastSectionsRoot: Codable {
    let sections: [PodcastSection]
} 

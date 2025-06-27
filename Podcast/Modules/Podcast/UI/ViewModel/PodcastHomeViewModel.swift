import Foundation

@MainActor
class PodcastHomeViewModel: ObservableObject {
    @Published private var sections: [PodcastSection] = []
    @Published private(set) var mediaSections: [MediaSectionType] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase
    
    init(fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase = FetchPodcastSectionsUseCase()) {
        self.fetchPodcastSectionsUseCase = fetchPodcastSectionsUseCase
    }
    
    func fetchSections() async {
        isLoading = true
        errorMessage = nil
        do {
            let sections = try await fetchPodcastSectionsUseCase.execute()
            self.sections = sections
            self.mediaSections = MediaSectionMapper.map(sections: sections)
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
} 

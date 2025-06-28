import Foundation
import Combine

@MainActor
class PodcastSearchViewModel: ObservableObject {
    // added private(set) for read only
    @Published private(set) var mediaSections: [MediaSectionType] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    @Published var searchText: String = ""

    private let fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase
    private var cancellables = Set<AnyCancellable>()

    init(fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase = FetchPodcastSectionsUseCase()) {
        self.fetchPodcastSectionsUseCase = fetchPodcastSectionsUseCase

        $searchText
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.performSearch(query: text)
            }
            .store(in: &cancellables)
    }

    func performSearch(query: String) {
        guard !query.isEmpty else {
            self.mediaSections = []
            return
        }
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let sections = try await fetchPodcastSectionsUseCase.executeSearch(query: query)
                self.mediaSections = MediaSectionMapper.map(sections: sections)
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
} 

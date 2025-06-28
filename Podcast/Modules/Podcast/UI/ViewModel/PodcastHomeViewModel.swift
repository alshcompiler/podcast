import Foundation

@MainActor
class PodcastHomeViewModel: ObservableObject {
    @Published private(set) var mediaSections: [MediaSectionType] = []
    @Published var isLoading = false
    @Published var isLoadingMore = false
    @Published var errorMessage: String?
    @Published var currentPage = 0
    @Published var totalPages = 1
    @Published var hasMorePages = true

    private let fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase
    
    init(fetchPodcastSectionsUseCase: FetchPodcastSectionsUseCase = FetchPodcastSectionsUseCase()) {
        self.fetchPodcastSectionsUseCase = fetchPodcastSectionsUseCase
    }
    
    func fetchSections() async {
        isLoading = true
        errorMessage = nil
        do {
            let result = try await fetchPodcastSectionsUseCase.executeWithPagination(page: 1)
            self.mediaSections = MediaSectionMapper.map(sections: result.sections)
            self.currentPage = 1
            self.totalPages = result.pagination.total_pages
            self.hasMorePages = currentPage < totalPages
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func loadMoreSections() async {
        guard hasMorePages && !isLoadingMore else { return }
        
        isLoadingMore = true
        do {
            let nextPage = currentPage + 1
            let result = try await fetchPodcastSectionsUseCase.executeWithPagination(page: nextPage)

            self.mediaSections.append(contentsOf: MediaSectionMapper.map(sections: result.sections))

            self.currentPage = nextPage
            self.hasMorePages = nextPage < result.pagination.total_pages
            isLoadingMore = false
        } catch {
            self.errorMessage = error.localizedDescription
            isLoadingMore = false
        }

    }
    
    func checkAndLoadMore(currentSection: MediaSectionType) {
        if hasMorePages && !isLoadingMore && !mediaSections.isEmpty && currentSection.id == mediaSections.last?.id {
            Task {
                await loadMoreSections()
            }
        }
    }
} 

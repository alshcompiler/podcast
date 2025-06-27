import SwiftUI

struct PodcastHomeView: View {
    @StateObject private var viewModel = PodcastHomeViewModel()

    private enum Constants {
        static let screenTitle = "Podcasts"
        static let loadingText = "Loading..."
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView(Constants.loadingText)
                } else if let error = viewModel.errorMessage {
                    ErrorView(errorMessage: error, retryAction: {
                        Task { await viewModel.fetchSections() }
                    })
                } else {
                    List {
                        ForEach(viewModel.mediaSections) { section in
                            switch section {
                            case .square(let sectionName, let items):
                                PodcastSquareSectionView(sectionName: sectionName, items: items)
                            case .twoLineGrid(let sectionName, let rows):
                                PodcastTwoLineGridSectionView(sectionName: sectionName, rows: rows)
                            case .bigSquare(let sectionName, let items):
                                PodcastBigSquareSectionView(sectionName: sectionName, items: items)
                            case .queue(let sectionName, let items):
                                PodcastQueueSectionView(sectionName: sectionName, items: items)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.bottom, 24) // Space between sections
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle(Constants.screenTitle)
        }
        .task {
            await viewModel.fetchSections()
        }
    }
}

#Preview {
    PodcastHomeView()
}

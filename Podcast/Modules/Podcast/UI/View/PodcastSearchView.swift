import SwiftUI

struct PodcastSearchView: View {
    @StateObject private var viewModel = PodcastSearchViewModel()
    @FocusState private var isSearchFieldFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                TextField("Search podcasts...", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($isSearchFieldFocused)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Searching...")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    ErrorView(errorMessage: error, retryAction: {
                        viewModel.performSearch(query: viewModel.searchText)
                    })
                    Spacer()
                } else if viewModel.mediaSections.isEmpty && !viewModel.searchText.isEmpty {
                    Spacer()
                    Text("No results found.")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.mediaSections, id: \.id) { section in
                            VStack {
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
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.bottom, 24)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Search")
            .onChange(of: viewModel.isLoading) { isLoading in
                if !isLoading {
                    isSearchFieldFocused = false
                }
            }
        }
    }
}

#Preview {
    PodcastSearchView()
} 

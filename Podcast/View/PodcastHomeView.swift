import SwiftUI

struct PodcastHomeView: View {
    @StateObject private var viewModel = PodcastHomeViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                        Button("Retry") {
                            Task { await viewModel.fetchSections() }
                        }
                        .padding()
                    }
                } else {
                    List {
                        ForEach(viewModel.mediaSections) { section in
                            switch section {
                            case .square(let sectionName, let items):
                                Section(header: Text(sectionName)) {
                                    ForEach(items) { item in
                                        LazyHStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            LazyVStack(alignment: .leading) {
                                                Text(item.title)
                                                    .font(.headline)
                                                item.durationText.map { Text($0).font(.subheadline) }
                                                item.dateText.map { Text($0).font(.caption) }
                                            }
                                        }
                                    }
                                }
                            case .twoLineGrid(let sectionName, let rows):
                                Section(header: Text(sectionName)) {
                                    ForEach(rows.indices, id: \.self) { rowIndex in
                                        LazyHStack {
                                            ForEach(rows[rowIndex]) { item in
                                                LazyVStack {
                                                    AsyncImage(url: URL(string: item.imageURL)) { image in
                                                        image.resizable()
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 50, height: 50)
                                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                                    Text(item.title)
                                                        .font(.headline)
                                                    item.durationText.map { Text($0).font(.subheadline) }
                                                    item.dateText.map { Text($0).font(.caption) }
                                                }
                                                .frame(maxWidth: .infinity)
                                            }
                                        }
                                    }
                                }
                            case .bigSquare(let sectionName, let items):
                                Section(header: Text(sectionName)) {
                                    ForEach(items) { item in
                                        LazyHStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 70, height: 70)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            LazyVStack(alignment: .leading) {
                                                Text(item.title)
                                                    .font(.headline)
                                            }
                                        }
                                    }
                                }
                            case .queue(let sectionName, let items):
                                Section(header: Text(sectionName)) {
                                    ForEach(items) { item in
                                        LazyHStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            LazyVStack(alignment: .leading) {
                                                Text(item.title)
                                                    .font(.headline)
                                                item.durationText.map { Text($0).font(.subheadline) }
                                                item.dateText.map { Text($0).font(.caption) }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Podcasts")
        }
        .task {
            await viewModel.fetchSections()
        }
    }
}

#Preview {
    PodcastHomeView()
} 

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
                            case .square(let items):
                                Section(header: Text("Square")) {
                                    ForEach(items) { item in
                                        HStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            VStack(alignment: .leading) {
                                                Text(item.title)
                                                    .font(.headline)
                                                item.durationText.map { Text($0).font(.subheadline) }
                                                item.dateText.map { Text($0).font(.caption) }
                                            }
                                        }
                                    }
                                }
                            case .twoLineGrid(let rows):
                                Section(header: Text("2 Line Grid")) {
                                    ForEach(rows.indices, id: \ .self) { rowIndex in
                                        HStack {
                                            ForEach(rows[rowIndex]) { item in
                                                VStack {
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
                            case .bigSquare(let items):
                                Section(header: Text("Big Square")) {
                                    ForEach(items) { item in
                                        HStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 70, height: 70)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            VStack(alignment: .leading) {
                                                Text(item.title)
                                                    .font(.headline)
                                            }
                                        }
                                    }
                                }
                            case .queue(let items):
                                Section(header: Text("Queue")) {
                                    ForEach(items) { item in
                                        HStack {
                                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            VStack(alignment: .leading) {
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

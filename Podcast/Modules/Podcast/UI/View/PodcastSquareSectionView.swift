import SwiftUI

struct PodcastSquareSectionView: View {
    let sectionName: String
    let items: MediaItems

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sectionName)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 8) {
                            // Podcast image
                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 160, height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

                            // Title
                            Text(item.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .foregroundColor(.white)

                            // Bottom row: duration and date
                            HStack {
                                if let duration = item.durationText, !duration.isEmpty {
                                    Label(duration, systemImage: "play.fill")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(Color(.systemGray4).opacity(0.7))
                                        .clipShape(Capsule())
                                }
                                Spacer()
                                if let date = item.dateText, !date.isEmpty {
                                    Text(date)
                                        .font(.caption2)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                        }
                        .frame(width: 180)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    PodcastSquareSectionView(
        sectionName: "Top Podcasts",
        items: [
            MediaItem(
                title: "Sample Podcast",
                durationText: "2h 30m",
                dateText: "2 hours ago",
                imageURL: "https://example.com/image.jpg"
            )
        ]
    )
    .background(Color.black)
} 

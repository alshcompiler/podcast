import SwiftUI

struct PodcastTwoLineGridItem: View {
    let items: [MediaItem] // Up to 2 items

    var body: some View {
        let cellWidth = UIScreen.main.bounds.width * 0.8
        LazyVStack(spacing: 16) {
            ForEach(items) { item in
                HStack(spacing: 12) {
                    // Podcast image
                    AsyncImage(url: URL(string: item.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                    VStack(alignment: .leading, spacing: 8) {
                        // Date label
                        if let date = item.dateText, !date.isEmpty {
                            Text(date)
                                .font(.caption2)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        // Title
                        Text(item.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        // Duration button
                        if let duration = item.durationText, !duration.isEmpty {
                            Label(duration, systemImage: "play.fill")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color(.systemGray4).opacity(0.7))
                                .clipShape(Capsule())
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6).opacity(0.15))
                .cornerRadius(16)
            }
        }
        .frame(width: cellWidth)
    }
} 

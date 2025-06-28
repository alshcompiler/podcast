import SwiftUI

struct PodcastTwoLineGridItemView: View {
    let items: MediaItems // Up to 2 items
    
    private enum Constants {
        static let cellWidthMultiplier: CGFloat = 0.8
        static let verticalSpacing: CGFloat = 16.0
        static let horizontalSpacing: CGFloat = 12.0
        static let imageSize: CGFloat = 120.0
        static let imageCornerRadius: CGFloat = 12.0
        static let contentSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 10.0
        static let verticalPadding: CGFloat = 4.0
        static let itemCornerRadius: CGFloat = 16.0
        static let iconSize: CGFloat = 18.0
        static let iconSpacing: CGFloat = 12.0
        static let iconPadding: CGFloat = 8.0
    }

    var body: some View {
        let cellWidth = UIScreen.main.bounds.width * Constants.cellWidthMultiplier
        VStack(spacing: Constants.verticalSpacing) {
            ForEach(items) { item in
                ZStack(alignment: .bottomTrailing) {
                    HStack(spacing: Constants.horizontalSpacing) {
                        // Podcast image
                        AsyncImage(url: URL(string: item.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius, style: .continuous))

                        VStack(alignment: .leading, spacing: 0) {
                            // Date label
                            if let date = item.dateText, !date.isEmpty {
                                Text(date)
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.7))
                                Spacer()
                            }
                            
                            // Title
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .lineLimit(2)
                            
                            Spacer()
                            
                            // Duration button
                            if let duration = item.durationText, !duration.isEmpty {
                                Label(duration, systemImage: "play.fill")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, Constants.horizontalPadding)
                                    .padding(.vertical, Constants.verticalPadding)
                                    .background(Color(.systemGray4).opacity(0.7))
                                    .clipShape(Capsule())
                            }
                        }
                        .frame(height: Constants.imageSize)
                        Spacer()
                    }
                    .background(Color(.systemGray6).opacity(0.15))
                    .cornerRadius(Constants.itemCornerRadius)

                    // Bottom right icons overlay
                    HStack(spacing: Constants.iconSpacing) {
                        Image(systemName: "text.badge.plus")
                            .resizable()
                            .frame(width: Constants.iconSize, height: Constants.iconSize)
                            .foregroundColor(.white)
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: Constants.iconSize * 1.2, height: Constants.iconSize * 0.3)
                            .foregroundColor(.white)
                    }
                    .padding(Constants.iconPadding)
                }
            }
        }
        .frame(width: cellWidth)
    }
} 

#Preview {
    PodcastTwoLineGridItemView(
        items: [
            MediaItem(
                title: "The Future ",
                durationText: "45:30",
                dateText: "2 hours ago",
                imageURL: "https://example.com/podcast1.jpg"
            ),
            MediaItem(
                title: "Technology Trends 2024",
                durationText: "32:15",
                dateText: "1 day ago",
                imageURL: "https://example.com/podcast2.jpg"
            )
        ]
    )
    .background(Color.black)
} 

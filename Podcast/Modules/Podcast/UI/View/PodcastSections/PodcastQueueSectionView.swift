import SwiftUI

struct PodcastQueueSectionView: View {
    let sectionName: String
    let items: [MediaItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(sectionName)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(items) { item in
                        PodcastQueueItemView(
                            imageURL: item.imageURL,
                            title: item.title,
                            duration: item.durationText ?? "",
                            date: item.dateText ?? ""
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    PodcastQueueSectionView(
        sectionName: "Your Queue",
        items: [
            MediaItem(
                title: "The Future of AI and Machine Learning",
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
import SwiftUI

struct PodcastSquareSectionView: View {
    let sectionName: String
    let items: MediaItems

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(sectionName)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(items) { item in
                        PodcastSquareItemView(
                            imageURL: item.imageURL,
                            title: item.title,
                            duration: item.durationText,
                            date: item.dateText
                        )
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

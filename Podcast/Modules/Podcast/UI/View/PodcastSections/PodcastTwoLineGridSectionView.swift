import SwiftUI

struct PodcastTwoLineGridSectionView: View {
    let sectionName: String
    let rows: [MediaItems]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(sectionName)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(rows, id: \ .self) { columnItems in
                        PodcastTwoLineGridItemView(items: columnItems)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
} 

#Preview {
    PodcastTwoLineGridSectionView(
        sectionName: "Trending Now",
        rows: [
            [
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
            ],
            [
                MediaItem(
                    title: "Startup Stories",
                    durationText: "28:45",
                    dateText: "3 hours ago",
                    imageURL: "https://example.com/podcast3.jpg"
                ),
                MediaItem(
                    title: "Design Thinking",
                    durationText: "41:20",
                    dateText: "5 hours ago",
                    imageURL: "https://example.com/podcast4.jpg"
                )
            ]
        ]
    )
    .background(Color.black)
} 

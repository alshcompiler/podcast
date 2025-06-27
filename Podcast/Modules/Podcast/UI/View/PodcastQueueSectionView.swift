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
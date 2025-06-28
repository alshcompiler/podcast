import SwiftUI

struct PodcastBigSquareSectionView: View {
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
                        PodcastBigSquareItemView(
                            imageURL: item.imageURL,
                            title: item.title
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
} 

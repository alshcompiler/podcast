import SwiftUI

struct PodcastTwoLineGridSectionView: View {
    let sectionName: String
    let rows: [MediaItems]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sectionName)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(rows, id: \ .self) { columnItems in
                        PodcastTwoLineGridItem(items: columnItems)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
} 

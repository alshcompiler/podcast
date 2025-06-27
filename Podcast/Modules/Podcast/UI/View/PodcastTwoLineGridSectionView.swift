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

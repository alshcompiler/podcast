import SwiftUI

struct PodcastBigSquareItemView: View {
    let imageURL: String
    let title: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background image
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

            // Overlay: title and episode count
            VStack(alignment: .leading, spacing: 4) {
                Spacer()
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            }
            .padding()
        }
        .frame(width: 200, height: 200)
    }
} 

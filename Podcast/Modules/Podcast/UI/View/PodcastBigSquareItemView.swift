import SwiftUI

struct PodcastBigSquareItemView: View {
    let imageURL: String
    let title: String

    private enum Constants {
        static let ratio: CGFloat = 4/3
        static let imageHeight: CGFloat = 165.0
        static let imageWidth = imageHeight * ratio // Dynamic
        static let cornerRadius: CGFloat = 24.0
        static let gradientHeight: CGFloat = 60.0
        static let titleSpacing: CGFloat = 4.0
        static let shadowRadius: CGFloat = 2.0
        static let titlePadding: CGFloat = 16.0
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background image
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(Constants.ratio, contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
            .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))

            // Gradient overlay for title (only bottom corners rounded)
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.0)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: Constants.gradientHeight)
            .mask(
                RoundedCorner(radius: Constants.cornerRadius, corners: [.bottomLeft, .bottomRight])
                    .frame(height: Constants.gradientHeight)
            )
            .frame(maxWidth: .infinity, alignment: .bottom)

            // Overlay: title
            VStack(alignment: .leading, spacing: Constants.titleSpacing) {
                Spacer()
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: Constants.shadowRadius)
                    .lineLimit(2) // Limit to 2 lines
            }
            .padding(Constants.titlePadding)
        }
        .frame(width: Constants.imageWidth, height: Constants.imageHeight)
    }
} 

#Preview {
    PodcastBigSquareItemView(
        imageURL: "https://example.com/big-podcast-image.jpg",
        title: "The Future of Technology and Innovation"
    )
    .background(Color.black)
} 

import SwiftUI

struct PodcastSquareItemView: View {
    let imageURL: String
    let title: String
    let duration: String?
    let date: String?

    private enum Constants {
        static let imageDimention: CGFloat = 140.0
        static let imageRadius: CGFloat = 24.0
        static let itemWidth: CGFloat = 160.0
        static let verticalSpacing: CGFloat = 8.0
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            // Podcast image
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: Constants.imageDimention, height: Constants.imageDimention)
            .clipShape(RoundedRectangle(cornerRadius: Constants.imageRadius, style: .continuous))
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(.white)
                .frame(maxWidth: Constants.imageDimention)

            // Bottom row: duration and date
            HStack {
                if let duration = duration, !duration.isEmpty {
                    Label(duration, systemImage: "play.fill")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray4).opacity(0.7))
                        .clipShape(Capsule())
                }
                Spacer()
                if let date = date, !date.isEmpty {
                    Text(date)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(maxWidth: Constants.imageDimention)
        }
        .frame(width: Constants.itemWidth, alignment: .leading)
        .padding(.horizontal, 0)
    }
}

#Preview {
    PodcastSquareItemView(
        imageURL: "https://example.com/image.jpg",
        title: "Sample Podcast",
        duration: "2h 30m",
        date: "2 hours ago"
    )
    .background(Color.black)
} 

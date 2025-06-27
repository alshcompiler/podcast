import SwiftUI

struct PodcastQueueItemView: View {
    let imageURL: String
    let title: String
    let duration: String
    let date: String
    
    private enum Constants {
        static let cornerRadius: CGFloat = 32.0
        static let imageSize: CGFloat = 120.0
        static let imageCornerRadius: CGFloat = 24.0
        static let playButtonSize: CGFloat = 36.0
        static let cardHeight: CGFloat = 140.0
        static let cardWidthMultiplier: CGFloat = 0.8
        static let horizontalSpacing: CGFloat = 8.0
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 8.0
        static let verticalPadding: CGFloat = 10.0
        static let trailingPadding: CGFloat = 4.0
    }

    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
            .fill(Color(red: 28/255, green: 29/255, blue: 38/255)) // dark background
            .overlay(
                HStack(spacing: Constants.horizontalSpacing) {
                    // Podcast image
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius, style: .continuous))

                    // Info
                    VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: Constants.horizontalSpacing) {
                            Text(duration)
                                .font(.body)
                                .foregroundColor(.red)
                            Text(date)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(alignment: .leading)
                    }
                    .padding(.vertical, Constants.verticalSpacing)

                    Spacer()

                    // Play button
                    VStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.black)
                                .frame(width: Constants.playButtonSize, height: Constants.playButtonSize)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, Constants.trailingPadding)
                        .padding(.vertical, Constants.verticalSpacing)
                    }
                }
                .padding(.horizontal, Constants.horizontalPadding)
                .padding(.vertical, Constants.verticalPadding)
            )
            .frame(width: UIScreen.main.bounds.width * Constants.cardWidthMultiplier, height: Constants.cardHeight)
    }
} 

#Preview {
    PodcastQueueItemView(
        imageURL: "https://example.com/podcast-image.jpg",
        title: "The Future of AI and Machine Learning in Modern Applications",
        duration: "45:30",
        date: "2 hours ago"
    )
    .background(Color.black)
} 

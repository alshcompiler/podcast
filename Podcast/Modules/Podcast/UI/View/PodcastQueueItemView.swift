import SwiftUI

struct PodcastQueueItemView: View {
    let imageURL: String
    let title: String
    let duration: String
    let date: String

    var body: some View {
        RoundedRectangle(cornerRadius: 32, style: .continuous)
            .fill(Color(red: 28/255, green: 29/255, blue: 38/255)) // dark background
            .overlay(
                HStack(spacing: 8) {
                    // Podcast image
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

                    // Info
                    VStack(alignment: .leading, spacing: 8) {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: 8) {
                            Text(duration)
                                .font(.body)
                                .foregroundColor(.red)
                            Text(date)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(alignment: .leading)
                    }
                    .padding(.vertical, 8)

                    Spacer()

                    // Play button
                    VStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.black)
                                .frame(width: 36, height: 36)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 4)
                        .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 10)
            )
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 140)
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

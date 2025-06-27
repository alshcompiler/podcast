import SwiftUI

struct PodcastQueueItemView: View {
    let imageURL: String
    let title: String
    let duration: String
    let date: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(red: 28/255, green: 29/255, blue: 38/255)) // dark background

            HStack(spacing: 16) {
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
                .padding(.leading, 8)

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
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 16)
                .padding(.trailing, 8)

                Spacer()
            }

            // Play button at bottom right of entire item
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.black)
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding([.bottom, .trailing], 16)
                }
            }
        }
        .frame(width: 420, height: 140) // Adjust width/height as needed
    }
} 
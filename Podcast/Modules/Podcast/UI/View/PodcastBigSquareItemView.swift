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
                    .aspectRatio(4/3, contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 220, height: 165) // 4:3 aspect ratio
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

            // Gradient overlay for title (only bottom corners rounded)
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.0)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: 60)
            .mask(
                RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight])
                    .frame(height: 60)
            )
            .frame(maxWidth: .infinity, alignment: .bottom)
            .offset(y: 0)

            // Overlay: title
            VStack(alignment: .leading, spacing: 4) {
                Spacer()
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .lineLimit(2) // Limit to 2 lines
            }
            .padding()
        }
        .frame(width: 220, height: 165)
    }
}

// Helper shape for rounding only specific corners
struct RoundedCorner: Shape {
    var radius: CGFloat = 24.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
} 

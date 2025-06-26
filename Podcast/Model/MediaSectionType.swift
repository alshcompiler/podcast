import Foundation
typealias MediaItems = [MediaItem]
enum MediaSectionType: Identifiable {
    case square(MediaItems)
    case twoLineGrid([MediaItems])
    case bigSquare(MediaItems)
    case queue(MediaItems)

    var id: UUID { UUID() }
}

struct MediaItem: Identifiable {
    let id = UUID()
    let title: String
    let durationText: String?
    let dateText: String?
    let imageURL: String
} 

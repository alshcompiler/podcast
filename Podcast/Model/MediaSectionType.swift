import Foundation
typealias MediaItems = [MediaItem]
enum MediaSectionType: Identifiable {
    case square(String, MediaItems)
    case twoLineGrid(String, [MediaItems])
    case bigSquare(String, MediaItems)
    case queue(String, MediaItems)

    var id: UUID { UUID() }
}

struct MediaItem: Identifiable {
    let id = UUID()
    let title: String
    let durationText: String?
    let dateText: String?
    let imageURL: String
} 

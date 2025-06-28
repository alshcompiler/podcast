import Foundation
typealias MediaItems = [MediaItem]
enum MediaSectionType: Identifiable, Hashable {
    case square(String, MediaItems)
    case twoLineGrid(String, [MediaItems])
    case bigSquare(String, MediaItems)
    case queue(String, MediaItems)

    var id: UUID {
        switch self {
        case .square(let string, let mediaItems):
            mediaItems.first?.id ?? UUID()
        case .twoLineGrid(let string, let array):
            array.first?.first?.id ?? UUID()
        case .bigSquare(let string, let mediaItems):
            mediaItems.first?.id ?? UUID()
        case .queue(let string, let mediaItems):
            mediaItems.first?.id ?? UUID()
        }
    }
}

struct MediaItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let durationText: String?
    let dateText: String?
    let imageURL: String
} 

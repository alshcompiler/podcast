import Foundation

struct MediaSectionMapper {
    static func map(sections: [PodcastSection]) -> [MediaSectionType] {
        sections.compactMap { section in
            guard let type = section.type else {
                assertionFailure("Type can't be nil")
                return nil
            }

            guard let sectionName = section.name else {
                assertionFailure("name type can't be nil")
                return nil
            }
            guard let content = section.content else { return nil }
            switch type.lowercased() {
            case .square:
                let items = content.map { $0.toMainMediaItem }
                return .square(sectionName, items)
            case .twoLinesGrid:
                let items = content.map { $0.toMainMediaItem }
                return .twoLineGrid(sectionName, items.chunked(2))
            case .bigSquare, .big_Square: // difference in response key due to dummy data
                let items = content.map { $0.toBigSquare }
                return .bigSquare(sectionName, items)
            case .queue:
                let items = content.map { $0.toMainMediaItem }
                return .queue(sectionName, items)
            default:
                let items = content.map { $0.toMainMediaItem }
                return .square(sectionName, items) //handle search here
            }
        }
    }
}

private extension String {
    static let square = "square"
    static let twoLinesGrid = "2_lines_grid"
    static let big_Square = "big_square"
    static let bigSquare = "big square"
    static let queue = "queue"
}

private extension Podcast {
    var toMainMediaItem: MediaItem {
        .init(
            title: name ?? "",
            durationText: duration?.durationText ?? "",
            dateText: release_date?.relativeTime ?? release_date ?? "",
            imageURL: avatar_url ?? ""
        )
    }

    var toBigSquare: MediaItem {
        .init(
            title: name ?? "",
            durationText: nil,
            dateText: nil,
            imageURL: avatar_url ?? ""
        )
    }
}

import Foundation

extension String {
    private static let isoFormatter = ISO8601DateFormatter()
    private static let relativeFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter
    }()
    
    var relativeTime: String {
        guard let date = Self.isoFormatter.date(from: self) else { return "" }
        return Self.relativeFormatter.localizedString(for: date, relativeTo: Date())
    }
} 

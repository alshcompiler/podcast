//
//  RoundedCorner.swift
//  Podcast
//
//  Created by Mostafa Sultan on 28/06/2025.
//

import SwiftUI

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

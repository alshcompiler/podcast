//
//  ArrayExtension.swift
//  Podcast
//
//  Created by Mostafa Sultan on 26/06/2025.
//


extension Array {
    func chunked(_ size: Int) -> [[Element]] {
        guard size > 0 else {
            assertionFailure("size can't be 0 or less")
            return []
        }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0+size, count)])
        }
    }
}
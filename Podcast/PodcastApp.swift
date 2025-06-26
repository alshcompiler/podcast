//
//  PodcastApp.swift
//  Podcast
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import SwiftUI
#if DEBUG
import netfox
#endif

@main
struct PodcastApp: App {
    init() {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

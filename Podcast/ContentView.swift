//
//  ContentView.swift
//  Podcast
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PodcastHomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

#Preview {
    ContentView()
}

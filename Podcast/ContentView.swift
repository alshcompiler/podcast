//
//  ContentView.swift
//  Podcast
//
//  Created by Mostafa Sultan on 26/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 4

    var body: some View {
        TabView(selection: $selectedTab) {
            // Settings
            Color.black
                .overlay(Text("Settings").foregroundColor(.white))
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("")
                }
                .tag(0)
            // Library
            Color.black
                .overlay(Text("Library").foregroundColor(.white))
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("")
                }
                .tag(1)
            // People (with badge)
            Color.black
                .overlay(Text("People").foregroundColor(.white))
                .tabItem {
                    Image(systemName: "person.3")
                    Text("")
                }
                .badge(3)
                .tag(2)
            // Search
            PodcastSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("")
                }
                .tag(3)
            // Home
            PodcastHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("")
                }
                .tag(4)
        }
        .accentColor(.white)
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

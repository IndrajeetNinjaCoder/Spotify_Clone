//
//  SpotifyTabBar.swift
//  Spotify_Clone
//
//  Created by test on 18/02/25.
//

import SwiftUI

struct SpotifyTabBar: View {
    @State private var selectedTab = 0

    var body: some View {
            HStack {
                TabBarItem(
                    icon: "house",
                    label: "Home",
                    isSelected: selectedTab == 0
                ) {
                    selectedTab = 0
                }
                TabBarItem(
                    icon: "magnifyingglass",
                    label: "Search",
                    isSelected: selectedTab == 1
                ) {
                    selectedTab = 1
                }
                TabBarItem(
                    icon: "books.vertical",
                    label: "Your Library",
                    isSelected: selectedTab == 2
                ) {
                    selectedTab = 2
                }
                TabBarItem(
                    icon: "platter.2.filled.iphone",
                    label: "Premium",
                    isSelected: selectedTab == 3
                ) {
                    selectedTab = 3
                }
            }
            .padding(.vertical, 8)
            .background(.spotifyBlack)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarItem: View {
    var icon: String
    var label: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .white : .gray)
                Text(label)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SpotifyTabBar()
}

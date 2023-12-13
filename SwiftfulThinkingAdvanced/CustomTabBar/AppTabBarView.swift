//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 11/12/23.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKev
// MatchedGeometryEffect
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home

    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .favorite, selection: $tabSelection)
            Color.orange
                .tabBarItem(tab: .profile, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .messages, selection: $tabSelection)
        }
    }
}
extension AppTabBarView {
    
    private var defaultTabBarView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
            Color.yellow
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            Color.orange
                .tabItem {
                     Image(systemName: "message")
                    Text("Messages")
                }
        }
    }
}

#Preview {
    AppTabBarView()
}

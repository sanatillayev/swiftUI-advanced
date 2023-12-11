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
    @State private var tabSelection: TabBarItem = TabBarItem(title: "Home", iconName: "house", color: .blue)

    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: TabBarItem(title: "Home", iconName: "house", color: .blue), selection: $tabSelection)
            Color.red
                .tabBarItem(tab: TabBarItem(title: "Favourites", iconName: "heart", color: .red), selection: $tabSelection)
            
            Color.orange
                .tabBarItem(tab: TabBarItem(title: "Profile", iconName: "person", color: .green), selection: $tabSelection)
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
        }
    }
}

#Preview {
    AppTabBarView()
}

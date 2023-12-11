//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 11/12/23.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab)
                    .onTapGesture {
                        switchToTab(tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white)
    }
}

let tabs : [TabBarItem] = [
    TabBarItem(title: "Home", iconName: "house", color: .blue),
    TabBarItem(title: "Favourites", iconName: "heart", color: .red),
    TabBarItem(title: "Profile", iconName: "person", color: .green)
]

#Preview {
    VStack{
        Spacer()
        CustomTabBarView(tabs: tabs, selection:.constant(tabs.first!))
    }
}

extension CustomTabBarView {
    
    
    private func tabView(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(_ tab: TabBarItem) {
        selection = tab
    }
}

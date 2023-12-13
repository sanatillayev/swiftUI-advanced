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
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
//        version1
        version2
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

let tabs : [TabBarItem] = [
    .home, .favorite, .profile
]

#Preview {
    VStack{
        Spacer()
        CustomTabBarView(tabs: tabs, selection:.constant(tabs.first!), localSelection: tabs.first!)
    }
}

extension CustomTabBarView {
    
    private var version1: some View {
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
    
    private func tabView(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(_ tab: TabBarItem) {
        selection = tab
    }
}


// 2 version

extension CustomTabBarView {
    
    private func tabView2(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.25))
                        .matchedGeometryEffect(id: "background", in: namespace )
                }
            }
        )
    }
    
    
    private var version2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab)
                    .onTapGesture {
                        
                        switchToTab(tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 5)
        .padding(.horizontal)
    }
}


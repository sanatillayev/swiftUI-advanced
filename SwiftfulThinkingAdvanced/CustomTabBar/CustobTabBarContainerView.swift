//
//  CustobTabBarContainerView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 11/12/23.
//

import SwiftUI


//struct TabView2<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
//}
//
//struct TabView3<SelectionValue: Hashable, Content: View> : View {
//}
struct CustomTabBarContainerView<Content: View> : View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }

    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
    }
}

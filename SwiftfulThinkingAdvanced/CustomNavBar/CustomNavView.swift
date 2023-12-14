//
//  CustomNavView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 14/12/23.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .toolbarRole(.navigationStack)
    }
}

#Preview {
    CustomNavView {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Hello world!!")
        }
    }
}

/// go back with swiping to right

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 13/10/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                CustomNavLink {
                    Text("Destination")
                        .customNavigationTitle("second screen")
                        .customNavigationBackButtonHidden(false)

                } label: {
                    Text("Go")
                }
            }
//            .customNavigationTitle("Custom title")
//            .customNavigationBackButtonHidden(true)
            
            .customToolBar(title: "title with toolbar", subtitle: nil, hidden: true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}


extension AppNavBarView {
    
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                
                NavigationLink {
                    Text("2 is here")
                        .navigationTitle("title2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }
                .navigationTitle("title1")
            }
        }
    }
}

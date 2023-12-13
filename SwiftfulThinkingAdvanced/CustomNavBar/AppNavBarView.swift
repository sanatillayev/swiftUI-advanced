//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 13/10/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
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

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

//
//  CustomNavLink.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 14/12/23.
//

import SwiftUI


struct CustomNavLink<Label: View, Destination: View>: View {
        let destination: Destination
        let label: Label
        init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
            self.destination = destination()
            self.label = label()
        }
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
            }
            .toolbar(.hidden, for: .navigationBar)
        } label: {
            label
        }
    }
}

#Preview {
    CustomNavView {
        CustomNavLink {
            Text("dest")
        } label: {
            Text("clickme")
        }
    }
    

}

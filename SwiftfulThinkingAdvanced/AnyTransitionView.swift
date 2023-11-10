//
//  AnyTransition.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 03/10/23.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    
    
    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}



struct AnyTransitionView: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 300)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .transition(.rotateOn)
                    .transition(.rotating)
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
            }
          
            Spacer()
            
            Text("Click me")
                .withDefaultButtonFormating()
                .onTapGesture {
                    withAnimation(.easeIn(duration: 2)) {
                        showRectangle.toggle()
                    }
                }

        }
    }
}

struct AnyTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionView()
    }
}

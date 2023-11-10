//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 03/10/23.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
        
    }
}

extension View {
    
    func withDefaultButtonFormating(color: Color = .blue) -> some View {
        modifier(ButtonViewModifier(color: color))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(ButtonViewModifier(color: .black))
            
            Text("Helloo")
                .withDefaultButtonFormating(color: .brown)
        }
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}

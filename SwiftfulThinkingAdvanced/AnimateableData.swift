//
//  AnimateableData.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 22/11/23.
//

import SwiftUI

struct AnimateableData: View {
    
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            VStack {
//                RoundedRectangle(cornerRadius: animate ? 60 : 0)
//                    .frame(width: 250, height: 250)
                RectangleWithSingleCorner(cornerRadius: animate ? 60 : 0)
                    .frame(width: 250, height: 250)
                Spacer()
                Pacman(offset: animate ? 30 : 0)
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}
struct RectangleWithSingleCorner: Shape {
    
    var cornerRadius: CGFloat
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        }
    }
}

struct Pacman: Shape {
    var offset: Double
    var animatableData: Double {
        get { offset }
        set { offset = newValue }
    }
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offset),
                endAngle: Angle(degrees: 360 - offset),
                clockwise: false)
        }
    }
}
#Preview {
    AnimateableData()
}

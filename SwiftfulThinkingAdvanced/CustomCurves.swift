//
//  CustomCurves.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 16/11/23.
//

import SwiftUI

struct CustomCurves: View {
    var body: some View {
        VStack {
            WaterShape()
                .ignoresSafeArea()
//                .frame(width: 200, height: 200)

//            QuadSample()
//                .frame(width: 200, height: 200)
//
//            ArcSample()
//                .stroke(lineWidth: 5)
//                .frame(width: 200, height: 200)
//
//            ShapeWihArc()
//                .frame(width: 200, height: 200)

        }
    }
}
/*
 
 topLeft  0:0       max:0 topRight
             _______
            |       |
            |       |
            |       |
            |       |
            |       |
            |       |
            ---------
botLeft 0:max        max:max botRight
  
*/

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.2, y: rect.height * 0.45 /* change Y*/))
            /// will be perfect when sum of X in both quads are equal to 1
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.8, y: rect.height * 0.55 /* change Y*/))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))


        }
    }
}
struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY),
                control: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}

struct ShapeWihArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))

            // bottom
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY - 65),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))

            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))

            // top left come back to initial point
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        }
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 40),
                endAngle: Angle(degrees: -40),
                clockwise: false)
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}
#Preview {
    CustomCurves()
}

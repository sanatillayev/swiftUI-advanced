//
//  CustomShapes.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 10/11/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
    
}
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let hOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - hOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + hOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Trepazoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            // so on ...

        }
    }
}

struct CustomShapes: View {
    var body: some View {
        ZStack(content: {
            
//            Image("steve-jobs")
//                .resizable()
//                .scaledToFit()
//                .clipShape(
//                    Triangle()
//                        .rotation(.degrees(180))
//                )
//            Triangle()
            Diamond()
//                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
//                .foregroundColor(.blue)
//                .trim(from: 0, to: 0.5)
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]),
//                                     startPoint: .leading,
//                                     endPoint: .trailing))
                .frame(width: 300, height: 300)
        })
    }
}

#Preview {
    CustomShapes()
}

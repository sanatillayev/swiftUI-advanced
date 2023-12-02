//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 02/12/23.
//

import SwiftUI

struct ScrollViewoffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader(content: { geometry in
                    Text("")
                        .preference(key: ScrollViewoffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                })
            )
            .onPreferenceChange(ScrollViewoffsetPreferenceKey.self, perform: { value in
                action(value)
            })
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    let title: String = "Title is here"
    @State private var scrollviewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollviewOffset) / 75)
                    .onScrollViewOffsetChanged { offset in
                        self.scrollviewOffset = offset
                    }
                
                contentLayer
            }
            .padding()
        }
        .overlay(content: {
            Text("\(scrollviewOffset)")
        })
        
        .overlay(alignment: .top) {
            navbarLayer.opacity(scrollviewOffset < 55 ? 1 : 0)
        }
    }
}
extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.25))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navbarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
#Preview {
    ScrollViewOffsetPreferenceKeyBootcamp()
}

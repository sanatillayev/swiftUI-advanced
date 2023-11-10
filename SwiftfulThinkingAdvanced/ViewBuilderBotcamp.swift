//
//  ViewBuilderBotcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 03/10/23.
//

import SwiftUI


struct HeaderView<Content:View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ViewBuilderBotcamp: View {
    var body: some View {
        VStack {
            HeaderView(title: "Title") {
                HStack {
                    Image(systemName: "heart.fill")
                }
            }
        }
    }
}

struct ViewBuilderBotcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ViewBuilderBotcamp()
        LocalViewBuilder(type: .three)
    }
}

// second sample for using the @ViewBuilder

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    
    @ViewBuilder private var headerSection: some View {
        
        switch type {
        case .one:
            Text("one")
        case .two:
            Text("twoo")
        case .three:
            Text("three")
        }
    }
}

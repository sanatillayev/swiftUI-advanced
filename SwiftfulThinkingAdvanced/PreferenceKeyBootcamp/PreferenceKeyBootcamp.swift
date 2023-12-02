//
//  PreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 02/12/23.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello World"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Nav title")
                /// 1st way of updating parent view's text from child view
//                    .customTitle("New title for this text using extension")
//                    .preference(key: CustomTitlePreferenceKey.self, value: "New Value")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    var body: some View {
        Text(text)
        /// 2nd way of updating parent view's text from child view
//            .preference(key: CustomTitlePreferenceKey.self, value: "NEW VALUE of text pf parent view")
            .onAppear(perform: getDatafromDatabase)
            .customTitle(newValue)

    }
    
    func getDatafromDatabase() {
        // download
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "new value from database"
        }
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

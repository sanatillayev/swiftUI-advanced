//
//  SwipeButton.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 04/10/23.
//

import SwiftUI

struct SwipeButton: View {
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
            List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)

                    }
                    .onDelete { indexSet in
                        items.remove(atOffsets: indexSet)
                    
                    }
                    

            }
            .listStyle(.plain)
    }
}

struct SwipeButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeButton()
    }
}

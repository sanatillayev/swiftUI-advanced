//
//  ListSwipeAction.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 05/10/23.
//

import SwiftUI

struct ListSwipeAction: View {
    
    @State var fruits : [String] = [
        "apple","banana", "orange","peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .cornerRadius(10)
                                .frame(height: 20)
                                .background(Color.red)
                        }
                        .tint(.gray)
                        
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("Share") {
                            
                        }
                        .tint(.cyan)
                        
                    }
                
            }
            .listRowBackground(Color.gray
            .padding(.vertical, 8))
//            .onDelete(perform: deleteItem)
            
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

struct ListSwipeAction_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeAction()
    }
}

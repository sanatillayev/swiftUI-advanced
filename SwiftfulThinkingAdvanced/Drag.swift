//
//  Drag.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 06/10/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State var items = ["1", "2", "3"]
    @State var draggedItem : (any View)?
    
    var body: some View {
        LazyVStack(spacing : 15) {
            ForEach(items.indices, id:\.self) { index in
                Text(items[index])
                    .frame(minWidth:0, maxWidth:.infinity, minHeight:50)
                    .border(Color.black).background(Color.red)
                    .onDrag({
                        let item = items[index]
                    self.draggedItem = item
                    return NSItemProvider(item: nil, typeIdentifier: item)
                })
                    .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: item, items: $items, draggedItem: $draggedItem))
            }
        }
    }
}

struct MyDropDelegate : DropDelegate {

    let item : any View
    @Binding var items : [String]
    @Binding var draggedItem : (any View)?

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem else {
            return
        }

        if draggedItem != item {
            let from = items.firstIndex(of: draggedItem)!
            let to = items.firstIndex(of: item)!
            withAnimation(.default) {
                self.items.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
}

struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

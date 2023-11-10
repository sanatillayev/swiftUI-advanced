//
//  GenericsBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 03/10/23.
//

import SwiftUI


// MARK: MODEL
struct GenericModel<T> {
    
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

// MARK: ViewModel
class GenericViewModel: ObservableObject {
    @Published var genericStringModel = GenericModel(info: "String")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        genericBoolModel = genericBoolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
    }
}


// MARK: ViewModel

struct GenericView<T:View> : View {
    
    let content: T
    let title: String
    
    var body: some View{
        VStack {
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Circle(), title: "Circle for the test:x")
            Text(vm.genericBoolModel.info?.description ?? "none")
            Text(vm.genericStringModel.info ?? "none")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}

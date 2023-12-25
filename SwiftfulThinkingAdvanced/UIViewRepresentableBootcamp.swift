//
//  UIViewRepresentableBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 14/12/23.
//

import SwiftUI


// used for cofert UIView from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    
    @State var textfield: String = ""
    var body: some View {
        VStack {
            Text(textfield)
            
            HStack {
                Text("SwiftUI")
                TextField("Type here...", text: $textfield)
                    .frame(height: 55)
                    .background(.gray)
            }
            
            HStack {
                Text("UIKit")
                UITextFieldViewRepresentable(text: $textfield)
                    .updatePlaceholder("new")
                    .frame(height: 55)
                    .background(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}



// MARK: UIKit TextField
struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    let color: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default placeholder", color: UIColor = .red) {
        self._text = text
        self.placeholder = placeholder
        self.color = color
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextfield()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    private func getTextfield() -> UITextField {
        let textfield = UITextField(frame: .zero)
        let placeholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor : color]
        )
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator  {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
    // from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}



struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

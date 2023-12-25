//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 14/12/23.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showSheet: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hi!")
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Click here!")
            })

        }
        .sheet(isPresented: $showSheet, content: {
            UIImagePickerControllerRepresentable(image: $image, showScreen: $showSheet)
//            BasicUIViewControllerRepresentable(labelText: "New text here")
        })
        
    }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
 
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    
    // from swiftUI to UIkit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator  {
        return Coordinator(image: $image, showSheet: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen: Bool

        init(image: Binding<UIImage?>, showSheet: Binding<Bool>) {
            self._image = image
            self._showScreen = showSheet
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            
            image = newImage
            showScreen = false
        }
    }
    
}



struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


class MyFirstViewController: UIViewController {
     
    var labelText: String = "Starting value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
    }
    
    
    
}

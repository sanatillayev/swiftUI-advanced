//
//  test.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 04/10/23.
//

import SwiftUI

struct test: View {
    
    @State var selection: String="1"
    @State var Options: [String]=[
        "Most recent", "Most liked","Most Popular"
    ]
    @State var selection2: String="Most liked"
    
    init() {
        //bg color of selected segment in ALL the segments in the project
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.black
        
        let attributes: [NSAttributedString.Key:Any] = [.foregroundColor: UIColor.white]
        // foreground = color of text
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack{
            Text("Title")
            
            Picker(
                selection: $selection) {
                    ForEach(1..<100) { number in
                        Text("\(number)")
                            .tag("\(number)")
                    }
                } label: {
                    Text("Picker")
                }

                .pickerStyle(.wheel)
            
        /// 2nd picker
        
            Picker(selection: $selection2) {
                ForEach(Options, id: \.self) { option in
                    Text("\(option)")
                        .tag("\(option)")
                }
            } label: {
                Text("Filter: \(selection2)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        
            // 3rd picker
        
            Picker(
                selection: $selection2) {
                    ForEach(Options.indices, id: \.self) { indexes in
                        Text("\(Options[indexes])")
                            .tag(Options[indexes])
                    }
                } label: {
                    Text("\(selection2)")
                }
                .pickerStyle(.segmented)
                .background(Color.red)

            Spacer()

        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

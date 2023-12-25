//
//  UnitTestingViewModel.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 18/12/23.
//

import Foundation
import SwiftUI

class UnitTestingBootcampViewModel: ObservableObject {

    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    
    init (isPremium: Bool) {
        self.isPremium = isPremium
                
    }
    
    func addItems(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectedItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        }
    }
}

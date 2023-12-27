//
//  UnitTestingView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 18/12/23.
//


/*
1. Unit Tests
- test the business logic in vour app

2. UI Tests
- tests the UI of vour app

*/
import SwiftUI

struct UnitTestingView: View {
    
    @StateObject private var vm: UnitTestingViewModel
    
    
    init (isPremium: Bool) {
        _vm = StateObject (wrappedValue: UnitTestingViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text (vm.isPremium.description)
    }
}

#Preview {
    UnitTestingView(isPremium: true)
}

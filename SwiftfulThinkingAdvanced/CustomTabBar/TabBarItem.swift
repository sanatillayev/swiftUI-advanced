//
//  TabBarItem.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 11/12/23.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let title: String
//    let iconName: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, favorite, profile, messages
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .profile:
            return "Profile"
        case .messages:
            return "Messages"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        case .messages:
            return "message"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.blue
        case .favorite:
            return Color.red
        case .profile:
            return Color.green
        case .messages:
            return Color.yellow
        }
    }
}


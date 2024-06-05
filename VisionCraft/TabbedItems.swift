//
//  TabbedItems.swift
//  VisionCraft
//
//  Created by Can on 13.03.2024.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case favorite
    case saves
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .saves:
         return "Save"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "star"
        case .saves:
            return "tray.and.arrow.down"
        }
    }
}

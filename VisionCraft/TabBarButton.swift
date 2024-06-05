//
//  TabBarButton.swift
//  VisionCraft
//
//  Created by Can on 13.03.2024.
//

import SwiftUI

struct TabBarButton: View {
    var title: String
    var imageName: String
    var index: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = index
        }, label: {
            VStack(spacing: 4) {
                Image(systemName: imageName)
                    .font(.title)
                Text(title)
                    .font(.footnote)
            }
            .foregroundColor(selectedTab == index ? .blue : .gray)
        })
    }
}

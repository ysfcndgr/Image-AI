//
//  StyleModel.swift
//  VisionCraft
//
//  Created by Can on 11.03.2024.
//

import SwiftUI

struct StyleModel: Identifiable {
    let id = UUID()
    let title: String
    let thumbImage: Image
    let prompt: String
    let negativePrompt: String
    var isSelected: Bool = false
}

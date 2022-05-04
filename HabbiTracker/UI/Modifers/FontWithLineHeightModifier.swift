//
//  File.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 04.05.2022.
//

import Foundation
import SwiftUI

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}


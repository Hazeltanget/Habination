//
//  FontWithLineHeight.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 29.04.2022.
//

import Foundation
import SwiftUI

extension View {
    func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: font, lineHeight: lineHeight))
    }
}

//
//  File.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import SwiftUI

extension Color {
    var uiColor: UIColor { .init(self) }
    
    var hexaRGB: String {
        let components = uiColor.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        print(hexString)
        return hexString
    }
}

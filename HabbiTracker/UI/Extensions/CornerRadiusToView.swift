//
//  CornerRadiusToView.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 28.04.2022.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

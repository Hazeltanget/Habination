//
//  PlaceHolderStyle.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 12.04.2022.
//

import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.vertical, 24)
                    .padding(.leading, 16)
                    .foregroundColor(.gray)
            }
            content
                .padding(.vertical, 24)
                .padding(.leading, 16)
                .foregroundColor(.black)
        }
        .background(Color.TextFieldBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

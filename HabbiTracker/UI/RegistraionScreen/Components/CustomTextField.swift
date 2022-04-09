//
//  CustomTextField.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 07.04.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    @Binding var text: String
    var body: some View {
        HStack {
        TextField(title, text: $text)
            .keyboardType(.emailAddress)
            .padding(.vertical, 24)
            .padding(.leading, 16)
        }
        .background(Color.TextFieldBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}


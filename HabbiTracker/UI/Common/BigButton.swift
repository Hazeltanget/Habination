//
//  AddNewHabbitButton.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct BigButton: View {
    
    var title: String
    var action: () -> ()
    var color: Color
    
    var fontColor: Color
    
    init(title:String, color: Color, fontColor: Color = .white,action: @escaping () -> ()) {
        self.title = title
        self.action = action
        self.color = color
        self.fontColor = fontColor
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Text(title)
                    .foregroundColor(fontColor)
                    .padding(.vertical, 22)
            }
            .frame(maxWidth: .infinity)
        }
        .background(color)
    }
}

struct AddNewHabbitButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BigButton(title: "Add new habbit", color: .AccentColor, action: {})
        }
    }
}

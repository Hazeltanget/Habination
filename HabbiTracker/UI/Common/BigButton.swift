//
//  AddNewHabbitButton.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct BigButton: View {
    
    var title: String
    var action: () -> Void
    var color: Color
    
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Text(title)
                    .foregroundColor(.white)
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
            BigButton(title: "Add new habbit", action: {}, color: .AccentColor)
        }
    }
}

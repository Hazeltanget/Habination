//
//  AddNewHabbitButton.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct AccentCustomButton: View {
    
    var title: String
    var action: () -> Void
    
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
        .background(Color.AccentColor)
    }
}

struct AddNewHabbitButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AccentCustomButton(title: "Add new habbit", action: {})
        }
    }
}

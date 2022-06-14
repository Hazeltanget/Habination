//
//  File.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import Foundation
import SwiftUI

struct ListRowOfHabbitProperty: View {
    var textColor: Color
    var text: String
    var num: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.vertical, 16)
            
            Spacer()
            
            Text(num)
                .foregroundColor(textColor)
                .font(.system(size: 16))
        }
    }
}

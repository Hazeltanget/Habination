//
//  File.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import Foundation
import SwiftUI  


    
    var text: String
    var isSettings: Bool
    var isNightMode: Bool
    
    @State private var isDayTheme = false
    
    var body: some View {
        HStack {
            if isSettings {
                Image("icon clock")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 16)
                
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.vertical, 16)
            } else {
                
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.vertical, 16)
                    .padding(.leading, 48)
            }
            
            Spacer()
            
            if isNightMode {
                Toggle("", isOn: $isDayTheme)
                    .padding(.trailing, 16)
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
            }
            
        }
    }
}

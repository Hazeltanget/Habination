//
//  ProfileScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
                
                Button(action: {}){
                    Text("Back")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                }
                Spacer()
            }
            .padding(.leading, 24)
            
            HStack {
                Image("User")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                    .padding(.vertical, 16)
                
                VStack (alignment: .leading, spacing: 0){
                    Text("Denis Bolshachkov")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                    
                    Text("@denbol")
                        .foregroundColor(.gray)
                        .foregroundColor(Color(#colorLiteral(red: 0.3061294854, green: 0.3463460803, blue: 0.4307467341, alpha: 1)))
                        .font(.system(size: 12))
                }
                .padding(.leading, 8)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16)
            
            
            VStack {
                ListRow(text: "Settings", isSettings: true, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListRow(text: "Completed 5", isSettings: false, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListRow(text: "History", isSettings: false, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListRow(text: "Night mode", isSettings: false, isNightMode: true)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .background(Color.BackgroundColor)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

struct ListRow: View {
    
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

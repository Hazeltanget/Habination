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
                ListSettingsRow(text: "Settings", isSettings: true, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListSettingsRow(text: "Completed 5", isSettings: false, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListSettingsRow(text: "History", isSettings: false, isNightMode: false)
                Divider()
                    .padding(.horizontal, 48)
                    .padding(.vertical, 0)
                ListSettingsRow(text: "Night mode", isSettings: false, isNightMode: true)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16)
            
            Spacer()
            
            BigButton(title: "Log out", action: {}, color: Color.BigButtonSecondColor)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.bottom, 12)
                .padding(.horizontal, 24)
        }
        .background(Color.BackgroundColor)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


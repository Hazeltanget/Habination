//
//  ProfileScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import SwiftUI

struct ProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isOnNightMode = false
    
    @State private var verticalOffset: CGFloat = 0.0
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                        
                        Text("Profile")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                    }
                }
                .padding(.leading, 16)
                
                Spacer()
                
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack {
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        
                        Image("icon clock")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                            .padding(.leading, 8)
                    }
                }
                .padding(.trailing, 16)
            }
            
            
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
            .padding(.top, 16)
            
            
            HStack {
                Text("Night Mode")
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.vertical, 16)
                
                Spacer()
                
                Toggle("", isOn: self.$isOnNightMode)
                    .padding(.trailing, 16)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 12)
            
            CarouselProfileHabbitsCard()
                .padding(.top, 16)
            
            
            
            Spacer()
            
            BigButton(title: "Log out", color: Color.BigButtonFourthColor, fontColor: Color(hex: "FF3B30"),action: {})
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

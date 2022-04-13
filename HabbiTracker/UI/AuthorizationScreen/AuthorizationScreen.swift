//
//  AuthorizationScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import SwiftUI

struct AuthorizationScreen: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Hi there!")
                    .foregroundColor(.black)
                
                Text("Wellcome to habbits tracker, we missed you!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            VStack (alignment: .leading){
                Text("email")
                    .font(.caption)
                    .bold()
                    .font(.system(size: 10))
                    .foregroundColor(.black)
                
                
                TextField("", text: $email)
                    .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty, placeholder: "Email"))
                    .keyboardType(.emailAddress)
            }
            .padding(.horizontal, 16)
            .padding(.top, 36)
            
            
            VStack (alignment: .leading){
                
                    Text("password")
                        .font(.caption)
                        .bold()
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                
                SecureField("", text: $password)
                    .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty, placeholder: "Password"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            
            Button(action: {}) {
                Text("Forget your password ?")
                    .font(.system(size: 16))
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            .padding(.top, 8)
            
            Spacer()
            
            BigButton(title: "Log in", action: {}, color: Color.AccentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal, 30)
            
            Button(action: {}){
                Text("Create account")
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.5))
            }
        }
        .background(Color.BackgroundColor)
        
    }
}

struct AuthorizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationScreen()
    }
}

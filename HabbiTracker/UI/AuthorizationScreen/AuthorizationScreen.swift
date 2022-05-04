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
    
    @State private var selection: String? = nil
    
    
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                VStack {
                    
                    
                    NavigationLink(tag: AutorizationNavigation.Registration.rawValue, selection: $selection) {
                        RegistrationScreen()        .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                    } label: {
                        EmptyView()
                    }

                    
                    NavigationLink(tag: AutorizationNavigation.Main.rawValue, selection: $selection) {
                        MainScreen()        .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)

                    } label: {
                        EmptyView()
                    }

                    
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Hi there!")
                                .foregroundColor(.black)
                                .frame(maxWidth: gr.size.width, alignment: .leading)
                            
                            Text("Wellcome to habbits tracker, we missed you!")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: gr.size.width * 0.6, alignment: .leading)
                        }
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 36)
                    
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
                    
                    BigButton(title: "Log in", color: Color.AccentColor, action: {
                        selection = AutorizationNavigation.Main.rawValue
                    })
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 30)
                    
                    Button(action: {
                        selection = AutorizationNavigation.Registration.rawValue
                    }){
                        Text("Create account")
                            .font(.system(size: 16))
                            .foregroundColor(.black.opacity(0.5))
                    }
                }
                .background(Color.BackgroundColor)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

struct AuthorizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationScreen()
    }
}

private enum AutorizationNavigation: String {
    case Main = "MainScreen"
    case Registration = "RegistrationScreen"
}

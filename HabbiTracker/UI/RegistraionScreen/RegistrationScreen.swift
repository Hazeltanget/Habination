//
//  RegistrationScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 07.04.2022.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var progress: Float = 0.3
    @State private var currentStep = 1
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                    Text("Registration")
                        .font(.system(size: 17))
                        .foregroundColor(Color.black)
                }
                
                Spacer()
                
                Text("Step \(currentStep) of 3")
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 4.0)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                        .frame(width: 24, height: 24)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear, value: progress)
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 8)
            }
            .padding(.leading, 24)
            .padding(.trailing, 16)
            
            TabView (selection: $currentStep) {
                RegistrationTab(text: $email, type: .email, isShowAutoGenerate: false)
                    .tag(1)
                
                RegistrationTab(text: $password, type: .password, isShowAutoGenerate: true)
                    .tag(2)
                
                RegistrationTab(text: $repeatPassword, type: .repeatPassword, isShowAutoGenerate: false)
                    .tag(3)
            }
            .disabled(true)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentStep)
            .transition(.slide)
            .background(Color.BackgroundColor)
            .overlay(
                VStack {
                    Spacer()
                    BigButton(title: "Next step", action: {
                        withAnimation {
                            progress += 0.35
                            currentStep += 1
                        }
                    }, color: .AccentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 24)
                }
            )
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.BackgroundColor)
        
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}

struct RegistrationTab: View {
    
    @State var text: String = ""
    
    var descriptionTitle: String
    var description: String
    var textFieldTitle: String
    var isShowAutoGenerate: Bool
    
    var type: RegistrationTabType
    
    init(text: Binding<String>, type: RegistrationTabType, isShowAutoGenerate: Bool) {
        self.type = type
        
        switch type {
        case .email:
            self.descriptionTitle = "Your e-mail"
            self.description = "It will receive emails related to your account"
            self.textFieldTitle = "E-mail"
            self.isShowAutoGenerate = false
            
        case .password:
            self.descriptionTitle = "Create password"
            self.description = "Password that is impossible to forget and hard to guess"
            self.textFieldTitle = "Password"
            self.isShowAutoGenerate = true
            
        case .repeatPassword:
            self.descriptionTitle = "Repeate password"
            self.description = "it is important for us to make sure that you remember your password"
            self.textFieldTitle = "Password"
            self.isShowAutoGenerate = true
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(descriptionTitle)
                        .foregroundColor(.black)
                    
                    Text(description)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 36)
            
            HStack {
                VStack (alignment: .leading){
                    Text(textFieldTitle.lowercased())
                        .font(.caption)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                    
                    if self.type != .email {
                        SecureField("", text: $text)
                            .textContentType(.newPassword)
                            .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: textFieldTitle))
                        
                    } else {
                        TextField("", text: $text)
                            .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: textFieldTitle))
                            .keyboardType(.emailAddress)
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 36)
            
            if isShowAutoGenerate {
                Button(action: {}) {
                    Text("Auto generate")
                        .font(.system(size: 16))
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.top, 8)
            }
            
            Spacer()
        }
        .background(Color.BackgroundColor)
    }
}

enum RegistrationTabType {
    case email, password, repeatPassword
}

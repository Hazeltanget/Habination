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
                RegistrationTab(text: $email, type: .email)
                    .tag(1)
                
                RegistrationTab(text: $email, type: .password)
                    .tag(2)
                
                RegistrationTab(text: $email, type: .repeatPassword)
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
                    AccentCustomButton(title: "Next step", action: {
                        progress += 0.35
                        currentStep += 1
                    })
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal, 30)
                        .padding(.bottom)
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
    @Binding var text: String
    
    var descriptionTitle: String
    var description: String
    var textFieldTitle: String
    
    
    init(text: Binding<String>, type: RegistrationTabType) {
        _text = text
        
        switch type {
        case .email:
            descriptionTitle = "Your e-mail"
            description = "It will receive emails related to your account"
            textFieldTitle = "E-mail"
            
        case .password:
            descriptionTitle = "Create password"
            description = "Password that is impossible to forget and hard to guess"
            textFieldTitle = "Password"
            
        case .repeatPassword:
            descriptionTitle = "Repeate password"
            description = "it is important for us to make sure that you remember your password"
            textFieldTitle = "Password"
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
            .padding(.trailing, 172)
            
            HStack {
                VStack (alignment: .leading){
                    Text(textFieldTitle.lowercased())
                        .font(.caption)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                    
                    CustomTextField(title: textFieldTitle, text: $text)
                        .foregroundColor(.black)
                    
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 36)
            
            Spacer()
        }
        .background(Color.BackgroundColor)
    }
}

enum RegistrationTabType {
    case email, password, repeatPassword
}

//AddNewHabbitButton(title: "Next step", action: {
//    progress += 0.35
//    currentStep += 1
//})
//    .clipShape(RoundedRectangle(cornerRadius: 14))
//    .padding(.horizontal, 30)
//    .padding(.bottom)

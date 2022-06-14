//
//  RegistrationScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 07.04.2022.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var progress: Int = 25
    @State private var currentStep = 1
    
    @State private var email = ""
    @State private var nickname = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    
    @EnvironmentObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            
            Header()
                .padding(.leading, 24)
                .padding(.trailing, 16)
            
            TabView (selection: $currentStep) {
                RegistrationTab(text: $email, isShowAutoGenerate: false, type: .email)
                    .gesture(DragGesture())
                    .tag(1)
                
                RegistrationTab(text: $nickname, isShowAutoGenerate: false, type: .nickName)
                    .gesture(DragGesture())
                    .tag(2)
                
                
                RegistrationTab(text: $password, isShowAutoGenerate: true, type: .password)
                    .gesture(DragGesture())
                    .tag(3)
                
                RegistrationTab(text: $repeatPassword, isShowAutoGenerate: false, type: .repeatPassword)
                    .gesture(DragGesture())
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentStep)
            .transition(.slide)
            .background(Color.BackgroundColor)
            .overlay(
                VStack {
                    Spacer()
                    BigButton(title: "Next step", color: .AccentColor, action: {
                        
                        withAnimation {
                            progress += 25
                            currentStep += 1
                        }
                        
                        print(currentStep)
                        if currentStep == 5 {
                            viewModel.register(withEmail: self.email, nickname: nickname, password: self.password)
                        }
                    })
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 24)
                }
            )
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.BackgroundColor)
        
    }
    
    
    
    @ViewBuilder
    private func Header() -> some View {
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
            
            Text("Step \(currentStep) of 4")
                .font(.system(size: 17))
                .foregroundColor(.black)
            
            
            ZStack {
                ProgressCircle(procent: $progress)
                    .frame(width: 25, height: 25)
                    .animation(.default, value: self.progress)
            }
            
//            ZStack {
//                Circle()
//                    .stroke(lineWidth: 4.0)
//                    .opacity(0.3)
//                    .foregroundColor(Color.gray)
//                    .frame(width: 24, height: 24)
//
//                Circle()
//                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
//                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
//                    .foregroundColor(Color.blue)
//                    .rotationEffect(Angle(degrees: 270.0))
//                    .animation(.linear, value: progress)
//                    .frame(width: 24, height: 24)
//            }
            .padding(.leading, 8)
        }
        
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}

struct RegistrationTab: View {
    
    @Binding var text: String
    
    var descriptionTitle: String {
        switch type {
        case .email:
            return "Your e-mail"
            
        case .password:
            return "Create password"
            
        case .repeatPassword:
            return "Repeate password"
        case .nickName:
            return "Create nickname"
        }
    }
    
    var description: String{
        switch type {
        case .email:
            return "It will receive emails related to your account"
            
        case .password:
            return "Password that is impossible to forget and hard to guess"
            
        case .repeatPassword:
            return "It is important for us to make sure that you remember your password"
        case .nickName:
            return "It will helps your friend to find your profile much easier"
        }
    }
    
    var title: String {
        switch type {
        case .email:
            return "E-mail"
        
        case .nickName:
            return "Nickname"
            
        case .password:
            return "Password"
            
        case .repeatPassword:
            return "Password"
        }
    }
    
    var isShowAutoGenerate: Bool
    
    var type: RegistrationTabType
    
    
    var body: some View {
        VStack {
            Description()
                .padding(.leading, 16)
                .padding(.top, 36)
            
            UserEnter()
                .padding(.horizontal, 16)
                .padding(.top, 36)
            
            Spacer()
            
        }
        .background(Color.BackgroundColor)
    }

    
    @ViewBuilder
    private func Description() -> some View{
        HStack {
            VStack (alignment: .leading) {
                Text(descriptionTitle)
                    .foregroundColor(.black)
                
                Text(description)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.6)
            }
            Spacer()
        }
        
    }
    
    @ViewBuilder
    private func UserEnter() -> some View{
        HStack {
            VStack (alignment: .leading){
                Text(title.lowercased())
                    .font(.caption)
                    .font(.system(size: 10))
                    .foregroundColor(.black)
                
                if self.type != .email && self.type != .nickName{
                    SecureField("", text: $text)
                        .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: title))
                        .textContentType(.newPassword)
                    
                } else {
                    TextField("", text: $text)
                        .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: title))
                        .keyboardType(.emailAddress)
                }
                
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
            }
            Spacer()
        }
    }
}

enum RegistrationTabType {
    case email, nickName, password, repeatPassword
}

//
//  ChangeProfileScreen.swift
//  Habination
//
//  Created by Денис Большачков on 13.05.2022.
//

import SwiftUI
import Firebase
import Kingfisher

struct ChangeProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthorizationViewModel
    
    @StateObject private var viewModel = ChangeProfileViewModel()
    
    @State private var nickname: String = ""
    @State private var email: String = ""
    @State private var disabledName = true
    
    
    @State private var image: UIImage?
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    @FocusState private var focus: FocusField?
    
    
    var body: some View {
        VStack {
            Header()
            ScrollView {
                VStack {
                    
                    UserImage()
                        .padding(.top, 16)
                    
                    UserEnter()
                        .padding(.top, 24)
                        .padding(.bottom, 48)
                    
                    Spacer()
                }
            }
        }
        .onAppear(perform: {
            self.nickname = authViewModel.currentUser!.nickname
            self.email = authViewModel.currentUser!.email
        })
        .overlay(
            VStack {
                Spacer()
                
                //TODO: validaiton
                
                BigButton(title: "Save", color: .AccentColor, action: {
                    
                    if let image = image {
                        authViewModel.uploadProfileImage(image)
                    }
                    
                })
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 30)
                    .padding(.bottom, 24)
            }
        )
        .background(Color.BackgroundColor)
    }
    
    @ViewBuilder
    private func Header() -> some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 21, height: 28)
                    
                    Text("Profile")
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                }
            }
            .padding(.leading, 16)
            
            Spacer()
            
            
            Button(action: {
                authViewModel.signOut()
            }){
                HStack (spacing: 6){
                    Text("Log out")
                        .foregroundColor(.black.opacity(0.5))
                        .font(.system(size: 16))
                    
                    Image("icon_arrow_logut")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.trailing, 16)
        }
    }
    
    @ViewBuilder
    private func UserImage() -> some View {
        VStack {
            ZStack (){
                
                if let user = authViewModel.currentUser {
                    if let image = image {
                        
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } else {
                        
                        KFImage.url(URL(string: user.profileImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }
                } else {
                    Image("User")
                        .resizable()
                        .clipShape(Circle())
                        .clipped()
                }
                
                Button(action: {
                    self.shouldPresentActionScheet = true
                }) {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.2))
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(width: 36, height: 36)
                .padding(.bottom, 4)

            }
            .sheet(isPresented: $shouldPresentImagePicker) {
                            ImagePicker(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
            }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
            .padding(.horizontal, 72)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func UserEnter() -> some View {
        VStack {
            
            VStack (spacing: 16) {
                OneRowUserEnter(title: "nickname", text: $nickname, nameFocusField: .nickname)
                OneRowUserEnter(title: "e-mail", text: $email, nameFocusField: .email)
            }
        }
    }
    
    
    @ViewBuilder
    private func OneRowUserEnter(title: String, text: Binding<String>, nameFocusField: FocusField) -> some View {
        VStack {
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            
            ZStack {
                TextField("Denis", text: text)
                    .textContentType(.newPassword)
                    .foregroundColor(.black)
                    .disabled(disabledName)
                    .padding(.vertical, 24)
                    .padding(.leading, 16)
                    .foregroundColor(.black)
                    .focused($focus, equals: nameFocusField)
                
                Image("icon_edit")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 24)
                    .onTapGesture {
                        self.disabledName.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            focus = nameFocusField
                        }
                    }
            }
            .background(Color.TextFieldBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 12)
        }

    }
}

struct ChangeProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfileScreen()
    }
}

enum FocusField: Hashable {
    case name, surname, nickname, email
}




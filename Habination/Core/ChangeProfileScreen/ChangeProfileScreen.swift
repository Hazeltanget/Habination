//
//  ChangeProfileScreen.swift
//  Habination
//
//  Created by Денис Большачков on 13.05.2022.
//

import SwiftUI

struct ChangeProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthorizationViewModel
    
    @State private var name = ""
    @State private var disabledName = true
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @FocusState private var focus: FocusField?
    
    var body: some View {
        VStack {
            Header()
            ScrollView {
                VStack {
                    
                    UserImage()
                        .padding(.top, 16)
                    
                    UserEnter()
                    Spacer()
                }
            }
        }
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
            ZStack (alignment: .bottom){
                
                Image("User")
                    .resizable()
                    .clipShape(Circle())
                    .clipped()
                
                Button(action: {
                    self.showImagePicker.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.2))
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                    .frame(width: 36, height: 36)
                    .padding(.bottom, 4)
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .padding(.horizontal, 72)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func UserEnter() -> some View {
        VStack {
            
            VStack (spacing: 16) {
                OneRowUserEnter(title: "name", text: $name, nameFocusField: .name)
                OneRowUserEnter(title: "surname", text: $name, nameFocusField: .surname)
                OneRowUserEnter(title: "nickname", text: $name, nameFocusField: .nickname)
                OneRowUserEnter(title: "e-mail", text: $name, nameFocusField: .email)
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
    
    private func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        profileImage = Image(uiImage: selectedImage)
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




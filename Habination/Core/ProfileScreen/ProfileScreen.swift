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
    
    @State private var showPopUpView = false
    
    @State private var editProfileScreen = false
    
    @StateObject var viewModel = ProfileViewModel()
    
    @EnvironmentObject var authViewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: $editProfileScreen) {
                ChangeProfileScreen()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            } label: {
                EmptyView()
            }

            
            Header()
    
            ProfileNav()
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            NighMode()
                .padding(.horizontal, 12)
            
            ProfileCarousel(viewModel: viewModel)
                .padding(.top, 16)
            
            
            Spacer()
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
    private func ProfileNav() -> some View {
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
        .onTapGesture {
            self.editProfileScreen.toggle()
        }
    }
    
    @ViewBuilder
    private func NighMode() -> some View {
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
    }
    
    @ViewBuilder
    private func PopUpView() -> some View {
        VStack {
            
            VStack {
                HStack {
                    
                    Text("Starred")
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {
                    }){
                        Image(systemName: "xmark")
                    }
                    .padding(.trailing, 16)
                }
                
                LazyVStack {
//                    ForEach(0..<viewModel.starredHabbits.count){ element in
//                        MakeOneRow(currentIndex: element, lastElement: viewModel.starredHabbits.count - 1)
//                    }
                }
            }
            .background(.white)
        }
    }
    
    
    @ViewBuilder
    private func MakeOneRow(currentIndex: Int, lastElement: Int) -> some View {
        HStack {
//            Text(viewModel.starredHabbits[currentIndex].title)
//                .foregroundColor(.black)
//                .font(.system(size: 15))
//                .padding(.vertical, 15)
//            
            Spacer()
            
            Image(systemName: "arrow.right")
            
        }
        .padding(.horizontal, 16)
        
        if currentIndex != lastElement {
            Divider()
                .padding(.horizontal, 16)
            
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

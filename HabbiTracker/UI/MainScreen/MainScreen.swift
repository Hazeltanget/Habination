//
//  MainScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct MainScreen: View {
    
    //var data = [Habbit]()
    @State var selection = "Habbits"
    var data = [Habbit(emoji: "🏃", title: "Run", progress: 0, color: "#ff443a"), Habbit(emoji: "🧘‍♂️", title: "Meditation", progress: 0, color: "#FF9F0A")]
    
    var body: some View {
            TabView (selection: self.$selection) {
                
                MainSubView(data: data)
                    .tag("Habbits")
            }
            .overlay(
                VStack {
                    Spacer()
                    BottomNavigation(currentTab: self.$selection)
                }
            )
            .edgesIgnoringSafeArea([.bottom])
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct MainSubView: View {
    
    var data: [Habbit]
    @State private var selection: String? = nil
    
    init(data: [Habbit]) {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        
        self.data = data
    }
    
    var body: some View {
        ScrollView{
            VStack (spacing: 0) {
                
                NavigationLink(tag: MainScreenNavigation.Profile.rawValue, selection: $selection) {
                    ProfileScreen()        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                } label: {
                    EmptyView()
                }

                
                NavigationLink(tag: MainScreenNavigation.AddNewHabbit.rawValue, selection: $selection) {
                    AddNewHabbitScreen()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)

                } label: {
                    EmptyView()
                }
                
                HStack{
                    
                    Text("My habits")
                        .font(.system(size: 22))
                        .fontWeight(Font.Weight.semibold)
                        .padding(.leading, 16)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Image("User")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                        .padding(.trailing, 9)
                        .onTapGesture {
                            self.selection = MainScreenNavigation.Profile.rawValue
                        }
                }
                
                TimeLapseSheet(type: .header)
                    .padding(.top, 6)
                
                if data.isEmpty {
                    
                    VStack {
                        Image("FunnyCloud")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal, 60)
                            .padding(.top, 36)
                        
                        Text("You have no hobbits yet. It’s time to make them!")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                            .padding(.horizontal, 69)
                            .padding(.top, 16)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    
                } else {
                    CardOfHabbits(data: data)
                        .padding(.top, 16)
                        .padding(.horizontal, 12)
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        .background(Color.BackgroundColor)
        .overlay(
            VStack {
                Spacer()
                
                BigButton(title: "Add new habbit", action: {
                    self.selection = MainScreenNavigation.AddNewHabbit.rawValue
                }, color: Color.AccentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                
            }
        )
    }
}

private enum MainScreenNavigation: String {
    case Profile = "ProfileScreen"
    case AddNewHabbit = "AddNewHabbitScreen"
}

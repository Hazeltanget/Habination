//
//  MainScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct MainScreen: View {
    
    var data = [Habbit]()
    //var data = [Habbit(emoji: "🏃", title: "Run", progress: 0, color: "#ff443a"), Habbit(emoji: "🧘‍♂️", title: "Meditation", progress: 0, color: "#FF9F0A")]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack (spacing: 0) {
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
                            .padding(.horizontal, 8)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(Color.BackgroundColor)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

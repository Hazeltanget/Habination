//
//  MainScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        ScrollView{
            VStack (spacing: 0) {
                
                HStack{
                    
                    Text("My habits")
                        .font(.system(size: 22))
                        .fontWeight(Font.Weight.semibold)
                        .padding(.leading, 16)
                    
                    
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
                
                CardOfHabbits()
                    .padding(.top, 16)
                    .padding(.horizontal, 8)
                
                Spacer()
            }
        }
        .background(Color.BackgroundColor)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

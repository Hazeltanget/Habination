//
//  ContentView.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            
//            MainScreen()
//                .tag(0)
//                .overlay(
//                    VStack{
//                        Spacer()
//                        AddNewHabbitButton(title: "Add new habbit", action: {
//
//                        })
//                            .clipShape(RoundedRectangle(cornerRadius: 14))
//                            .padding(.horizontal, 24)
//                            .padding(.bottom, 16)
//
//                    }
//                )
//                .tabItem {
//                    Label("Main", systemImage: "house.fill")
//                }
            RegistrationScreen()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

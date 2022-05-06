//
//  CardOfHabbits.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 09.03.2022.
//

import SwiftUI

struct CardOfHabbits: View {
    
    var data: [Habit]
    
    @State private var isShowHabbitScreen = false
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 0) {
        
            
            ForEach(data, id: \.id) { item in
                
                NavigationLink(isActive: self.$isShowHabbitScreen) {
                    HabitScreen(habit: item)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    EmptyView()
                }

                    
                OneHabbitCard(emoji: item.emoji, title: item.title, progressInProcent: item.progress)
                    .background(Color(hex: item.color))
                    .onTapGesture {
                        self.isShowHabbitScreen.toggle()
                    }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


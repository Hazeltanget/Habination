//
//  CardOfHabbits.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 09.03.2022.
//

import SwiftUI

struct CardOfHabbits: View {
    
    var data = [Habbit(emoji: "🏃", title: "Run", progress: 0, color: "#ff443a"), Habbit(emoji: "🧘‍♂️", title: "Meditation", progress: 0, color: "#FF9F0A")]
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 0) {
            
            ForEach(data, id: \.id) { item in
                    
                OneHabbitCard(emoji: item.emoji, title: item.title, progressInProcent: item.progress)
                    .background(Color(hex: item.color))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct CardOfHabbits_Previews: PreviewProvider {
    static var previews: some View {
        CardOfHabbits()
    }
}

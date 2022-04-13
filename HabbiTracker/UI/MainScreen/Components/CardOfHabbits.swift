//
//  CardOfHabbits.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 09.03.2022.
//

import SwiftUI

struct CardOfHabbits: View {
    
    var data: [Habbit]
    
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


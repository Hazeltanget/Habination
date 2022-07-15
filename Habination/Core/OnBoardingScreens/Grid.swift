//
//  Grid.swift
//  Habination
//
//  Created by Darya Zhitova on 12.07.2022.
//

import SwiftUI

struct Grid: View {
    let items = ["🏃", "🎸", "🧘", "📚", "🍳", "👨‍👩‍👧", "🧠", "🤺", "🤽‍♂️", "👣", "👨‍🎓", "🚰", "♟", "😀", "📸", "💃"]
    
    let coloms = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var body: some View {
        
        LazyVGrid(columns: coloms, spacing: 0) {
            ForEach(items, id: \.self) { item in
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Text(item)
                        .font(.largeTitle)
                }
            }
        }
        .padding()
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}

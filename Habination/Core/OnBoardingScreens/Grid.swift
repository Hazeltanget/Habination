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
        GridItem(.fixed(88)),
        GridItem(.fixed(88)),
        GridItem(.fixed(88)),
        GridItem(.fixed(88))
    ]
    var body: some View {
        
        LazyVGrid(columns: coloms) {
            ForEach(items, id: \.self) { item in
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Text(item)
                        .font(.largeTitle)
                }
                .frame(width: 90, height: 90)
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

//
//  BottomNavigation.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import SwiftUI

struct BottomNavigation: View {
    
    var data = ["Habbits", "Calendar", "Progress"]
    
    @Binding var currentTab: String 

    var columns = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        LazyVGrid (columns: columns, spacing: 0) {
            ForEach(data, id: \.self){ item in
                Button(action: {
                    withAnimation {
                        currentTab = item
                    }
                }) {
                    Text(item)
                        .font(.system(size: 16))
                        .foregroundColor(currentTab == item ? .white : .black)
                        .padding(.vertical, 25)
                }
                .frame(maxWidth: .infinity)
                .background(currentTab == item ? .blue : .clear)
                .clipShape(RoundedRectangle(cornerRadius: 34))
            }
        }
    }
}

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
                .padding(8)
            }
        }
        .background(.white)
        .cornerRadius(48, corners: [UIRectCorner.topLeft, UIRectCorner.topRight])
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

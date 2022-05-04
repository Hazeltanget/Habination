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
                    VStack (spacing: 4){
                        Text(item)
                            .font(.system(size: 16))
                            .foregroundColor(currentTab == item ? .black : .black.opacity(0.5))
                            .padding(.vertical, 25)
                            .frame(height: 30)
                        
                        if currentTab == item {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                        
                        }
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .clipShape(RoundedRectangle(cornerRadius: 34))
                .padding(8)
            }
        }
        .background(.white)
        .cornerRadius(24, corners: [UIRectCorner.topLeft, UIRectCorner.topRight])
    }
}

struct BottomNav_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            BottomNavigation(currentTab: .constant("Habbits"))
        }
        .background(.blue)
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

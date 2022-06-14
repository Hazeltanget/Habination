//
//  ProfileCarousel.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 04.05.2022.
//

import SwiftUI

struct ProfileCarousel: View {
    @State var currentIndex = 0
    @State var offset: CGFloat = CGFloat.zero
    
    @GestureState var gestureState: CGFloat = CGFloat.zero
    
    var widthOneHabbitCard = UIScreen.main.bounds.width * 0.56
    
    var countItem = 3
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing: 0) {
                        ForEach (0..<countItem){ item in
                            ZStack {
                                GeometryReader { gr in
                                    Color.clear
                                        .frame(width: 1, height: 1)
                                        .preference(key: ScrollOffsetPreferenceKey.self, value: [gr.frame(in: .global).minX])
                                }
                            }
                            .frame(maxHeight: .zero)
                            
                            ProfileHabbitCard(viewModel: viewModel, action: {})
                                .frame(width: widthOneHabbitCard)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }
                }.onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.offset = value[0]
                }
            }
            
            
            ZStack(alignment: .leading) {
                HStack {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: (UIScreen.main.bounds.width * 0.4) / 3)
                        .offset(x: -offset * 0.35)
                        .animation(.default, value: offset)
                    Spacer()
                }
            }
            .cornerRadius(10)
            .frame(width: UIScreen.main.bounds.width * 0.4, height: 4)
            .background(Color(hex: "DFDFDF"))
            .padding()
            
            Spacer()
        }
    }
}



private struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}

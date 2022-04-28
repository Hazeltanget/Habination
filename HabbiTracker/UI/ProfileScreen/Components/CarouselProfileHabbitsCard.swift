//
//  CarouselProfileHabbitsCard.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 22.04.2022.
//

import SwiftUI
struct CarouselProfileHabbitsCard: View {
    
    @State private var currentIndex = 0
    @State private var offset: CGFloat = CGFloat.zero
    
    @GestureState private var gestureState: CGFloat = CGFloat.zero
    
    private var widthOneHabbitCard = UIScreen.main.bounds.width * 0.56
    
    private var countItem = 3
    
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
                            
                            ProfileHabbitCard()
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

struct CarouselProfileHabbitsCard_Previews: PreviewProvider {
    static var previews: some View {
        CarouselProfileHabbitsCard()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}


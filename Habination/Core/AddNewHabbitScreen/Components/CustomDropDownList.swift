//
//  CustomDropDownList.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 29.03.2022.
//

import SwiftUI

struct CustomDropDownList: View {
    
    @State private var expand = false
    
    @Binding var currentRemindType: String
    
    var data = [RemindTypeHabit.EveryDay.rawValue, RemindTypeHabit.Monthly.rawValue, RemindTypeHabit.Weekly.rawValue, RemindTypeHabit.Annual.rawValue]
    
    var body: some View {
        VStack (spacing: 0){
            HStack {
                
                Text(currentRemindType)
                    .padding(.leading, 16)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 12, height: 5)
                    .padding(.trailing, 18)
                    .foregroundColor(.black)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 46)
            .background(.white)
            .onTapGesture {
                withAnimation (){
                    self.expand.toggle()
                }
            }
            
            if expand {
                VStack (spacing: 0){
                    ForEach(data, id: \.self){ item in
                        Button(action: {
                            currentRemindType = item
                        }) {
                            HStack {
                                
                                Text(item)
                                    .padding(.leading, 16)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .padding(.bottom, 8)
                        .background(.white)
                    }
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(height: 1)
                        .padding(.top, 8)
                    
                    HStack {
                        
                        Text("Custom")
                            .padding(.leading, 16)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
                .background(.white)
            }
                
        }
        .animation(.interpolatingSpring(mass: 1.0,
                                         stiffness: 100.0,
                                         damping: 10,
                                        initialVelocity: 0), value: expand)
    }
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

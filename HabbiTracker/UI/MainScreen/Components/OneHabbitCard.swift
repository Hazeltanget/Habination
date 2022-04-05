//
//  OneHabbitCard.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 10.03.2022.
//

import SwiftUI

struct OneHabbitCard: View {
    
    var emoji: String
    var title: String
    @State var progressInProcent: Int
    
    @State var isDone = false
    
    var body: some View {
        VStack{
            HStack{
                Text(emoji)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.leading, 4)
                
                Text( String(progressInProcent) + "%")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.leading, 4)
                    .opacity(0.8)
                
                Spacer()
                
                Button(action: {
                    self.isDone.toggle()
                    
                    withAnimation(.spring()){
                        if isDone == true {
                            if progressInProcent < 100{
                                progressInProcent += 12
                            }
                        } else {
                            if progressInProcent < 100{
                                progressInProcent -= 12
                            }
                        }
                    }
                }){
                    if isDone{
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 54 + CGFloat(progressInProcent))
    }
}

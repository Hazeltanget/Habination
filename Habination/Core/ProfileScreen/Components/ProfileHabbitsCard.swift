//
//  InfoAboutHabbitsCard.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 21.04.2022.
//

import SwiftUI
struct ProfileHabbitCard: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    let countViewHabbit = 3
    
    @State private var showPopUpBottomCard = false
    
    var action: () -> ()
    
    var body: some View {
        
        VStack {
            makeProfileHeader()
            
            VStack (spacing: 0){
                
                ForEach(0..<viewModel.starredHabbits.count) { element in
                    
                    if element < countViewHabbit {
                        makeOneRow(currentIndex: element, lastElement: countViewHabbit - 1)
                        
                        if element != countViewHabbit - 1 {
                            Divider()
                                .padding(.horizontal, 16)
                            
                        }
                    }
                }
                
            }
            
            Button(action: {
                action()
            }){
                Text("\(viewModel.starredHabbits.count - 3) More")
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .padding(.top, 7)
            .padding(.bottom, 16)
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
        }
        .background(.white)
    }
    
    @ViewBuilder
    private func makeProfileHeader() -> some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
            
            Text("Starred")
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.leading, 8)
            
            
            Text("0")
                .foregroundColor(.black.opacity(0.5))
                .font(.system(size: 16))
                .padding(.leading, 4)
            
        }
        .padding(.top, 16)
        .padding(.leading, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func makeOneRow(currentIndex: Int, lastElement: Int) -> some View {
        HStack {
            Text(viewModel.starredHabbits[currentIndex].title)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .padding(.vertical, 15)
            
            Spacer()
            
            Image(systemName: "arrow.right")
            
        }
        .padding(.horizontal, 16)
        
        if currentIndex != lastElement {
            Divider()
                .padding(.horizontal, 16)
            
        }
    }
}

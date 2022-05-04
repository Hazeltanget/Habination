//
//  AddNewHabbitScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 06.04.2022.
//

import SwiftUI

struct AddNewHabbitScreen: View {
    
    @State private var habbitName = ""
    
    @State private var selectedColor: Color = .clear
    @State private var selectedDays = Set<UUID>()

    
    @Environment(\.presentationMode) var presentationMode
    
    let colors = [Color.yellow, Color.orange, Color.green, Color.blue, Color.gray, Color.brown, Color.indigo, Color.mint, Color.cyan, Color.pink, Color.red, Color.teal]
    
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("", text: $habbitName)
                    .placeholder(when: habbitName.isEmpty, placeholder: {
                        Text("Name of your habbit")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    })
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                
                
                Text("Or choose of suggestion")
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                    .foregroundColor(.black)
                
                TimeLapseSheet(type: .suggestion)
                
                VStack (spacing: 12){
                    Text("Remind")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                    
                    CustomDropDownList()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                
                VStack (spacing: 12){
                    Text("On time")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                    
                    CustomDropDownList()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                
                VStack (spacing: 12){
                    Text("On time")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                    
                    ChooseReminder(type: .onDays, selectedItems: $selectedDays)
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                
                VStack (spacing: 12){
                    Text("Choose color")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                    
                    LazyVGrid (columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()), ], spacing: 8) {
                        
                        ForEach(colors, id: \.self) { item in
                            Button(action: {
                                self.selectedColor = item
                            }){
                                ZStack {
                                    Circle()
                                        .fill(selectedColor == item ? .black : .clear)
                                    
                                    Circle()
                                        .fill(item)
                                        .frame(width: 45, height: 45)
                                }
                            }
                        }
                        .frame(width: 51, height: 51)
                    }
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                
                
                
                
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .background(Color.BackgroundColor)
    }
}

struct AddNewHabbitScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabbitScreen()
    }
}

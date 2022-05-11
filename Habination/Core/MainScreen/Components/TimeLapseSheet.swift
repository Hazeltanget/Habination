//
//  TimeLapseSheet.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 09.03.2022.
//

import SwiftUI

struct TimeLapseSheet: View {
    
    var data: [TimeLapseModel] = [TimeLapseModel(title: "Today"), TimeLapseModel(title: "Weekly"), TimeLapseModel(title: "Mothly"), TimeLapseModel(title: "Annual"), TimeLapseModel(title: "CertainDay")]
    
    @EnvironmentObject var mainViewModel: MainScreenViewModel
    
    @State private var currentData: String
    
    init(type: TypeLapseSheet) {
        switch type {
        case .header:
            let date = Date()
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            
            dateFormatter.dateFormat = "MMMM"
            dateFormatter.locale = Locale(identifier: "en")
            
            let monthString = dateFormatter.string(from: date)
            let currentNumberOfDay = calendar.component(.month, from: date)
            
            currentData = String(currentNumberOfDay) + " " + monthString.lowercased().prefix(3)
            break
            
        case .suggestion:
            currentData = ""
            break
        }
    }
    
    
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(data){ item in
                        
                        if item.title == "Today"{
                            
                            HStack {
                                
                                Button(action: {
                                    mainViewModel.remindHabitType = item.title
                                }) {
                                    Text(item.title + ", ")
                                        .foregroundColor(.black)
                                        .foregroundColor(mainViewModel.remindHabitType == item.title ? Color.black.opacity(1) : Color.black.opacity(0.7))
                                    +
                                    Text(currentData)
                                        .italic()
                                        .foregroundColor(.blue)
                                    
                                }
                                .padding(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
                            }
                            .background(mainViewModel.remindHabitType == item.title ? .white : Color.BackgroundColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.leading, 16)
                        } else {
    
                            HStack {
                                
                                Button(action: {
                                    mainViewModel.remindHabitType = item.title
                                }) {
                                    Text(item.title)
                                        .foregroundColor(mainViewModel.remindHabitType == item.title ? Color.black.opacity(1) : Color.black.opacity(0.7) )
                                        
                                }.padding(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
                            }
                            .background(mainViewModel.remindHabitType == item.title ? .white : Color.BackgroundColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
            }
        }
        .background(Color.BackgroundColor)
        .onAppear {
            mainViewModel.remindHabitType = data[0].title
        }
    }
    
    func setDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "en")
        
        let monthString = dateFormatter.string(from: date)
        let currentNumberOfDay = calendar.component(.month, from: date)
        
        currentData = String(currentNumberOfDay) + " " + monthString.lowercased().prefix(3)
    }
}


struct dfjkls: PreviewProvider {
    static var previews: some View {
        TimeLapseSheet(type: .header)
    }
}

struct TimeLapseModel: Identifiable {
    var id = UUID()
    var title: String
}

enum TypeLapseSheet {
    case suggestion, header
}

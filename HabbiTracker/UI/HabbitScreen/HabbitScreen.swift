//
//  HabbitScreen.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import SwiftUI

struct HabbitScreen: View {
    
    var habbit = Habbit(emoji: "🏃", title: "Run", progress: 0, color: "#FF9500")
    var headerOfCalendar: String
    
    init() {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "en")
        
        let monthString = dateFormatter.string(from: date)
        let currentYear = calendar.component(.year, from: date)
        
        headerOfCalendar = monthString + " " + String(currentYear)
    }
    
    var body: some View {
        VStack {
            
            VStack{
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                        Text("Habbits")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {}){
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 36, height: 36)
                            
                            HStack (spacing: 2){
                                Circle()
                                    .fill(.white)
                                    .frame(width: 4, height: 4)
                                Circle()
                                    .fill(.white)
                                    .frame(width: 4, height: 4)
                                Circle()
                                    .fill(.white)
                                    .frame(width: 4, height: 4)
                            }
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 4)
                }
                
                HStack (spacing: 4){
                    Text(habbit.emoji)
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    Text(habbit.title)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.white)
                    Text(String(habbit.progress) + "%")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.white.opacity(0.4))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,16)
                .padding(.bottom, 24)
            }
            .background(Color(hex: self.habbit.color))
            
            
            ScrollView (showsIndicators: false){
                VStack (spacing: 0){
                    Text("Staticstic")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 48)
                        .padding(.leading, 16)
                    
                    Text("Don’t stop, only 17 times left for you to make it your real hobbit")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .padding(.leading, 16)
                        .padding(.top, 16)
                    
                    Text("31 out of 48 done")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.leading, 16)
                    
                    VStack {
                        ListRowOfHabbitProperty(textColor: Color(hex: habbit.color), text: "Total times done", num: "31")
                        Divider()
                        
                        ListRowOfHabbitProperty(textColor: Color(hex: habbit.color), text: "Current streak", num: "31")
                        Divider()
                        
                        ListRowOfHabbitProperty(textColor: Color(hex: habbit.color), text: "Best streak", num: "31")
                        
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        Text("Calendar")
                            .font(.system(size: 16))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 4)
                        
                        CustomCalendar(headerOfCalendar: self.headerOfCalendar, color: Color(hex: habbit.color))
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 48)
                }
            }
        }
        .background(Color.BackgroundColor)
    }
}

struct HabbitScreen_Previews: PreviewProvider {
    static var previews: some View {
        HabbitScreen()
    }
}

struct CustomCalendar: View {
    var headerOfCalendar: String
    var color: Color
    @State private var currentMonth: Int = 0
    
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
    
    var body: some View {
        VStack {
            HStack {
                Text(headerOfCalendar)
                    .padding(.bottom, 24)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                
                Spacer()
                
                
            }
            
            let days: [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
            
            VStack  {
                LazyVGrid(columns: columns, spacing: 0){
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(extractDate()){ value in
                        ZStack {
                            Text("\(value.day)")
                                .font(.system(size: 10))
                                .padding(0)
                        }
                        .frame(width: 45, height: 46)
                        .clipShape(Rectangle())
                        .background(color)
                    }
                }
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return []
        }
        
        return currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
    }
}

extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        let range = calendar.range(of: .day, in: .month, for: self)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day, to: self)!
        }
    }
}

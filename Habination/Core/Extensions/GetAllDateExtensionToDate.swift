//
//  GetAllDateExtensionToDate.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 29.04.2022.
//

import Foundation

extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

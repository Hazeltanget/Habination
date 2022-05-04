//
//  DateValue.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 13.04.2022.
//

import Foundation

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

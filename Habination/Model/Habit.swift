//
//  Habbit.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Habit: Identifiable, Decodable, Encodable {
    @DocumentID var id: String?
    var emoji: String
    var title: String
    var progress: Int
    var color: String
    var type: String
    var todayIsEdit: Bool
    var remindType: String
    var uid: String
}

enum TypeHabit: String {
    case Starred = "Starred", History = "History", Completed = "Completed", Active = "Active"
}

enum RemindTypeHabit: String {
    case EveryDay = "Everyday", Weekly = "Weekly", Monthly = "Monthly", Annual = "Annual"
}

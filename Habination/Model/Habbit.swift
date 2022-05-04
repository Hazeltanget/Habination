//
//  Habbit.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import Foundation

struct Habbit {
    var id = UUID()
    var emoji: String
    var title: String
    var progress: Int
    var color: String
    var type: String
}

enum TypeHabbit: String {
    case Starred = "Starred", History = "History", Completed = "Completed", Active = "Active"
}

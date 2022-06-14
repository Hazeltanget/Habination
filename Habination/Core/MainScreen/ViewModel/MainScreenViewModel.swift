//
//  MainScreenViewModel.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import Firebase

class MainScreenViewModel: ObservableObject {
    
    @Published var habits = [Habit]()
    @Published var remindHabitType: String = "" {
        willSet {
        }
    }
    
    let service: HabitService = HabitService()
    
    init() {
        self.fetchHabits()
    }
    
    func fetchHabits() {
        service.fetchHabits { habits in
            self.habits = habits
        }
        
    }
    
    func updateHabit(habit: Habit) {
        service.updateHabit(habit: habit)
    }
}

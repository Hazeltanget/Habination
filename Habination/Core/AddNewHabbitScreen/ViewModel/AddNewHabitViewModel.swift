//
//  AddNewHabitViewModel.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation

class AddNewHabitViewModel: ObservableObject {
    @Published var didUploadHabit: Bool = false
    
    let service = HabitService()
    
    func uploadHabit(habit: Habit) {
        service.uploadHabit(habit: habit){ success in
            if success {
                self.didUploadHabit = true
            } else {
                 
            }
        }
    }
}

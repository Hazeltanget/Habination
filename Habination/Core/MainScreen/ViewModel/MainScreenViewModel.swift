//
//  MainScreenViewModel.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    @Published var habbits = [Habit]()
    
    let service: HabitService = HabitService()
    
    init() {
        self.fetchHabits()
    }
    
    func fetchHabits() {
        service.fetchHabits { habbits in
            self.habbits = habbits
        }
    }
}

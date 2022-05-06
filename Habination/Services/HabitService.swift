//
//  HabitService.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import Firebase

struct HabitService {
    func uploadHabit(habit: Habit, completion: @escaping (Bool) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["emoji": habit.emoji,
                    "title": habit.title,
                    "progress": habit.progress,
                    "color": habit.color,
                    "type": habit.type,
                    "todayIsEdit": habit.todayIsEdit,
                    "uid": uid] as [String: Any]
        
        
        Firestore.firestore().collection("habits").document()
            .setData(data){ error in
                if error != nil {
                    completion(false)
                    return 
                }
                
                completion(true)
            }
    }
    
    func fetchHabits(completion: @escaping ([Habit]) -> ()) {
        
        var habits = [Habit]()
        
        Firestore.firestore().collection("habits").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            documents.forEach { doc in
                guard let habit = try? doc.data(as: Habit.self) else { return }
                
                if (habit.uid == uid) {
                    habits.append(habit)
                }
            }
            
            
            completion(habits)
        }
    }
    
    func updateHabit(habit: Habit) {
        if let documentId = habit.id {
            do {
                try Firestore.firestore().collection("habits").document(documentId).setData(from: habit)
            } catch {
                print(error)
            }
        }
    }
}



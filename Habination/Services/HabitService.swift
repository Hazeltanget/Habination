//
//  HabitService.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct HabitService {
    
    @AppStorage("userUid") var userUid: String = ""
    
    func uploadHabit(habit: Habit, completion: @escaping (Bool) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["emoji": habit.emoji,
                    "title": habit.title,
                    "progress": habit.progress,
                    "color": habit.color,
                    "type": habit.type,
                    "remindType": habit.remindType,
                    "datesOfComplete": habit.datesOfComplete,
                    "currentStreak": habit.currentStreak,
                    "bestStreak": habit.bestStreak,
                    "numberOfComplete": habit.numberOfComplete,
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
        
        Firestore.firestore().collection("habits").whereField("uid", isEqualTo: self.userUid).addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            habits = documents.compactMap{(try? $0.data(as: Habit.self))}
            
            completion(habits)
        }
    }
    
    func fetchHabitsByField(fieldName: String, fieldValue: String, completion: @escaping ([Habit]) -> ()){
        
        var habits = [Habit]()
        
        Firestore.firestore().collection("habits").whereField(fieldName, isEqualTo: fieldValue).addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            habits = documents.compactMap{(try? $0.data(as: Habit.self))}
            
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



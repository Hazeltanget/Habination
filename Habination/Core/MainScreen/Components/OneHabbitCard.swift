//
//  OneHabbitCard.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 10.03.2022.
//

import SwiftUI

struct OneHabbitCard: View {
    
    var habit: Habit
    
    @State var progressInProcent: Int
    
    @State var isDone: Bool
    
    init(habit: Habit) {
        self.habit = habit
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        _progressInProcent = State(initialValue: habit.progress)
        _isDone = State(initialValue: dateFormatter.string(from: Date.now) == habit.datesOfComplete.last ? true : false)
    }
    
    @EnvironmentObject var mainScreenViewModel: MainScreenViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(habit.emoji)

                Text(habit.title)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.leading, 4)
                
                Text(String(progressInProcent) + "%")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.leading, 4)
                    .opacity(0.8)
                
                Spacer()
                
                Button(action: {
                    self.isDone.toggle()
                    
                    withAnimation(.spring()){
                        updateHabit(isDone: self.isDone)
                    }
                }){
                    if isDone{
                        
                        Image("CheckIcon")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                    } else {
                        Image("CircleImage")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 54 + CGFloat(progressInProcent))
    }
    
    private func updateHabit(isDone: Bool) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        if isDone {
            var datesComplete = [String]()
            
            datesComplete = habit.datesOfComplete
            
            datesComplete.append(dateFormatter.string(from: Date.now))
            
            self.progressInProcent = habit.progress + (100 / habit.numberOfComplete)
            
            mainScreenViewModel.updateHabit(habit: Habit(id: habit.id, emoji: habit.emoji, title: habit.title, progress: habit.progress + (100 / habit.numberOfComplete), color: habit.color, type: habit.type, remindType: habit.remindType, datesOfComplete: datesComplete, currentStreak: habit.currentStreak + 1, bestStreak: habit.bestStreak == habit.currentStreak ? habit.bestStreak + 1 : habit.bestStreak, numberOfComplete: habit.numberOfComplete, uid: habit.uid))
        
        } else {
            
            var datesComplete = [String]()
            
            datesComplete = habit.datesOfComplete
            
            datesComplete.removeLast()
            
            self.progressInProcent = habit.progress - (100 / habit.numberOfComplete)
            
            mainScreenViewModel.updateHabit(habit: Habit(id: habit.id, emoji: habit.emoji, title: habit.title, progress: habit.progress - (100 / habit.numberOfComplete), color: habit.color, type: habit.type, remindType: habit.remindType, datesOfComplete: datesComplete, currentStreak: habit.currentStreak - 1, bestStreak: habit.bestStreak == habit.currentStreak ? habit.bestStreak - 1 : habit.bestStreak, numberOfComplete: habit.numberOfComplete, uid: habit.uid))
        }

    }
}

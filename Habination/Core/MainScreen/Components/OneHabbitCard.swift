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
        
        _progressInProcent = State(initialValue: habit.progress)
        _isDone = State(initialValue: habit.todayIsEdit)
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
                        if self.isDone == true {
                            if progressInProcent < 100{
                                progressInProcent += 12
                                mainScreenViewModel.updateHabit(habit: Habit(id: self.habit.id, emoji: self.habit.emoji, title: self.habit.title, progress: progressInProcent, color: self.habit.color, type: self.habit.type, todayIsEdit: true, remindType: habit.remindType, uid: self.habit.uid))
                            }
                        } else {
                            if progressInProcent < 100{
                                progressInProcent -= 12
                            }
                        }
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
}

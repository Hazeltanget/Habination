//
//  ProfileViewModel.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 04.05.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var starredHabbits = [Habbit(emoji: "🏃", title: "Run", progress: 0, color: "#ff443a", type: TypeHabbit.Active.rawValue), Habbit(emoji: "🧘‍♂️", title: "Meditation", progress: 0, color: "#FF9F0A", type: TypeHabbit.Active.rawValue), Habbit(emoji: "🧘‍♂️", title: "Walk With Dog", progress: 0, color: "#FF9F0A", type: TypeHabbit.Active.rawValue), Habbit(emoji: "🧘‍♂️", title: "Sleep", progress: 0, color: "#FF9F0A", type: TypeHabbit.Active.rawValue),
                                       Habbit(emoji: "🧘‍♂️", title: "Sleep", progress: 0, color: "#FF9F0A", type: TypeHabbit.Active.rawValue)]
    
}

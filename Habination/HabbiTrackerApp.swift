//
//  HabbiTrackerApp.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct HabbiTrackerApp: App {
    
    @StateObject var viewModel: AuthorizationViewModel = AuthorizationViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
             ContentView()
                .environmentObject(viewModel)
        }
    }
}

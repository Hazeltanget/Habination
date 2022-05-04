//
//  ContentView.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 05.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                AuthorizationScreen()
            } else {
                MainScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

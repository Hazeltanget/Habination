//
//  RegistrationViewModel.swift
//  Habination
//
//  Created by Денис Большачков on 04.05.2022.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
}

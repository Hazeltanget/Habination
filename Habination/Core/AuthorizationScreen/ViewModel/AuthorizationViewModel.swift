//
//  AuthorizationViewModel.swift
//  Habination
//
//  Created by Денис Большачков on 04.05.2022.
//

import Foundation
import Firebase

class AuthorizationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        if let userSession = userSession {
            UserDefaults.standard.set(userSession.uid, forKey: "userUid")
        }
    }
    
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            //save to user defaults
            UserDefaults.standard.set(user.uid, forKey: "userUid")
        }
    }
    
    func register(withEmail email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email": email, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data)
            
        }
    }
    
    func signOut() {
        userSession = nil
        
        try? Auth.auth().signOut()
    }
}

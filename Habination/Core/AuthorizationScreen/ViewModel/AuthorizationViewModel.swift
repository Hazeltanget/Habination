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
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service: UserService = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        if let userSession = userSession {
            UserDefaults.standard.set(userSession.uid, forKey: "userUid")
        }
        
        self.fetchUser() 
    }
    

    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to auth \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            //save to user defaults
            UserDefaults.standard.set(user.uid, forKey: "userUid")
        }
    }
    
    func register(withEmail email: String, nickname: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let data = ["email": email,"nickname": nickname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data)
            
        }
    }
    
    
    func signOut() {
        userSession = nil
        
        try? Auth.auth().signOut()
    }
    
    func updateEmail(_ email: String) {
        
        guard let uid = userSession?.uid else {return}
        let authUser = Auth.auth().currentUser
        
        authUser?.updateEmail(to: email, completion: { error in
            if let error = error {
                print(error)
            } else {
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData(["email": email]){ [self] _ in
                        self.fetchUser()
                    }
            }
        })
    }
    
    func updateNickname(_ nickname: String){
        
        guard let uid = userSession?.uid else {return}
        
        Firestore.firestore().collection("users")
            .document(uid)
            .updateData(["nickname":  nickname]) { [self] _ in
                self.fetchUser()
            }
    }
    
    func uploadProfileImage(_ postImage: UIImage) {
        
        guard let uid = userSession?.uid else {return}
        
        
        UploadImage.uploadImage(image: postImage){ profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl":  profileImageUrl]) { [self] _ in
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}

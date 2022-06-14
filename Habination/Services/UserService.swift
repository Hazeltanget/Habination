//
//  UserService.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import Firebase

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping (User) -> ()) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
}

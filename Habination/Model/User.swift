//
//  User.swift
//  Habination
//
//  Created by Денис Большачков on 05.05.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
}

//
//  UploadImage.swift
//  Habination
//
//  Created by Денис Большачков on 19.05.2022.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import UIKit

struct UploadImage {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> ()){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image\(filename)")
        
        ref.putData(imageData, metadata: nil){ _, error in
            if let error = error {
                print("DEBUG: " + error.localizedDescription)
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {
                    return
                }
                completion(imageUrl)
            }
        }
    }
}

//
//  UserRepository.swift
//  FindLocalGuide
//
//  Created by Cristina on 26.09.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository {

    let db = Firestore.firestore()
    func addUser(user: User) {
        print("Adding user")
        var dictionary: [String: Any] = [
            "uid": user.uid,
            "email": user.email,
            "firstname": user.firstName,
            "lastName": user.lastName,
            "city": user.city,
            "state": user.state,
            "country": user.country,
            "zipCode": user.zipCode
            ]
        print(dictionary)
        db.collection("users").document(user.email).setData(["data": dictionary],
               merge: true) { error in
                 guard error == nil else {
                     print("Error: ", error )
                    return
                 }
            }
        
    }
}

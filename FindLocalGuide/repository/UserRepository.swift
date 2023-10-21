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

class UserRepository: ObservableObject {

    let db = Firestore.firestore()
    
    func addUser(user: TouristUser) {
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
        db.collection("users").document(user.email).setData(dictionary,
               merge: true) { error in
                 guard error == nil else {
                     print("Error: ", error )
                    return
                 }
            }
        
    }

    func getUsers() async -> [TouristUser] {

      var users = [TouristUser]()
      var user: TouristUser = TouristUser(uid: "", email: "", firstName:"",lastName:"", city:"", state:"",country:"", zipCode:"")
      do {
          let snapshot = try await db.collection("users").getDocuments()
          snapshot.documents.forEach { documentSnapshot in
              let documentData = documentSnapshot.data()
              user.uid = documentData["uid"] as! String
              user.email = documentData["email"] as! String
              user.firstName = documentData["firstname"] as! String
              user.lastName = documentData["lastName"] as! String
              user.city = documentData["city"] as! String
              user.state = documentData["state"] as! String
              user.country = documentData["country"] as! String
              user.zipCode = documentData["zipCode"] as! String
              users.append(user)
          }
          } catch {
              print(error)
          }
        
      return users
      }
    
}

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
    
    func addTouristUser(user: User) {
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
        db.collection("touristUsers").document(user.email).setData(dictionary,
               merge: true) { error in
                 guard error == nil else {
                     print("Error: ", error )
                    return
                 }
            }
        
    }
    
    func addGuideUser(user: GuideUser) {
        var dictionary: [String: Any] = [
            "uid": user.uid,
            "email": user.email,
            "firstname": user.firstName,
            "lastName": user.lastName,
            "city": user.city,
            "state": user.state,
            "country": user.country,
            "zipCode": user.zipCode,
            "description": user.description,
            "availabilityDates": user.availabilityDates
            ]
        db.collection("guideUsers").document(user.email).setData(dictionary,
               merge: true) { error in
                 guard error == nil else {
                     print("Error: ", error )
                    return
                 }
            }
        
    }

    func getTouristUsers() async -> [User] {

      var users = [User]()
      var user: User = User(uid: "", email: "", firstName:"",lastName:"", city:"", state:"",country:"", zipCode:"")
      do {
          let snapshot = try await db.collection("touristUsers").getDocuments()
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
    
    func getGuideUsers() async -> [GuideUser] {

      var users = [GuideUser]()
        var user: GuideUser = GuideUser(uid: "", email: "", firstName:"",lastName:"", city:"", state:"",country:"", zipCode:"", description: "", availabilityDates: [])
      do {
          let snapshot = try await db.collection("guideUsers").getDocuments()
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
              user.description = documentData["description"] as! String
              user.availabilityDates = documentData["availabilityDates"] as! [DateInterval]

              users.append(user)
          }
          } catch {
              print(error)
          }
        
      return users
      }
    
    
    
}

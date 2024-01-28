//
//  User.swift
//  FindLocalGuide
//
//  Created by Cristina on 22.10.2023.
//

import Foundation


class User: Codable {

    var uid: String
    var email: String
    var firstName: String
    var lastName: String
    var city: String
    var state: String
    var country: String
    var zipCode: String

    init(uid: String, email: String, firstName: String, lastName: String, city: String, state: String, country: String, zipCode: String) {
        self.uid = uid
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.state = state
        self.country = country
        self.zipCode = zipCode
    }
}

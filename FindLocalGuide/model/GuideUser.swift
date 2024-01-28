//
//  GuideUser.swift
//  FindLocalGuide
//
//  Created by Cristina on 16.10.2023.
//

import Foundation

class GuideUser: User {
    
    var description: String
    var availabilityDates: [DateInterval]
    
    init(uid: String, email: String, firstName: String, lastName: String, city: String, state: String, country: String, zipCode: String, description: String, availabilityDates: [DateInterval]) {
        self.description = description
        self.availabilityDates = availabilityDates
        super.init(uid: uid, email: email, firstName: firstName, lastName: lastName, city: city, state: state, country: country, zipCode: zipCode)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

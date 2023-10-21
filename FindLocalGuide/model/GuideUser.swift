//
//  GuideUser.swift
//  FindLocalGuide
//
//  Created by Cristina on 16.10.2023.
//

import Foundation

struct GuideUser: Codable {

    var uid: String
    var email: String
    var firstName: String
    var lastName: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
    var description: String
    var availabilityDates: [Date]
    

    
}

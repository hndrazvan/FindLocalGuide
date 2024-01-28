//
//  AppDelegate.swift
//  FindLocalGuide
//
//  Created by Cristina on 27.01.2024.
//

import Foundation

import Foundation
import SwiftUI
import Stripe

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        StripeAPI.defaultPublishableKey = AppConstants.STRIPE_PUBLISHING_KEY
        return true
    }
    
}

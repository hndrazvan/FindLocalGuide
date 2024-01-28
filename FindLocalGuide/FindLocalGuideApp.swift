//
//  FindLocalGuideApp.swift
//  FindLocalGuide
//
//  Created by Cristina on 06.09.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Stripe

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    StripeAPI.defaultPublishableKey = AppConstants.STRIPE_PUBLISHING_KEY


    return true
  }
}

@main
struct FindLocalGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            StartupPage()
        }
    }
}

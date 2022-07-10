//
//  AppDelegate.swift
//  Bank
//
//  Created by Asadullah Behlim on 09/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
       
       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.makeKeyAndVisible()
           window?.backgroundColor = .systemBackground
           window?.rootViewController = LoginViewController()

           return true
       }
}

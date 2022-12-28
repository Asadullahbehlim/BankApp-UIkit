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
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.makeKeyAndVisible()
           window?.backgroundColor = .systemBackground
           loginViewController.delegate = self
           onboardingContainerViewController.delegate = self
        
           window?.rootViewController = loginViewController
        //   window?.rootViewController = onboardingContainerViewController
           return true
       }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didlogin() {
     setRootViewController(onboardingContainerViewController)
    }
}
    
extension AppDelegate: OnboardingContainerViewControllerdelegate {
    func didfinishOnboarding() {
        print("Test Login1")
    }
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

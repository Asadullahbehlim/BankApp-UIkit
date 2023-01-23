//
//  AppDelegate.swift
//  Bank
//
//  Created by Asadullah Behlim on 09/07/22.
//

import UIKit

let appColor: UIColor = .systemTeal
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
   
    
       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.makeKeyAndVisible()
           window?.backgroundColor = .systemBackground
           loginViewController.delegate = self
           onboardingContainerViewController.delegate = self
           dummyViewController.logoutDelegate = self
        
           
           displayLogin()
           return true
       } // Func Application Closed
    
    
          private func displayLogin() {
               setRootViewController(loginViewController)
           }
           
          private func displayNextScreen() {
              if LocalState.hasOnboarded {
                  PrepMainView()
                  setRootViewController(mainViewController)
              } else {
                  setRootViewController(onboardingContainerViewController)
              }
             
           }
           
          private func PrepMainView() {
              mainViewController.setStatusBar()
              UINavigationBar.appearance().isTranslucent = false
              UINavigationBar.appearance().backgroundColor = appColor
               
           }
//
//           let vc = mainViewController
//           vc.setStatusBar()
//
//           UINavigationBar.appearance().isTranslucent = false
//           UINavigationBar.appearance().backgroundColor = appColor
//
//            window?.rootViewController = vc
          // window?.rootViewController = AccountSummaryViewController()
         //  window?.rootViewController = loginViewController
         // window?.dummyViewController = dummyViewController
         // window?.rootViewController = onboardingContainerViewController
           
       //    mainViewController.selectedIndex = 0  // To manage default tab of screen
          // return true
       
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


extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didlogin()
    {
        displayNextScreen()
    }
}
extension AppDelegate: OnboardingContainerViewControllerdelegate {
    func didfinishOnboarding() {
        LocalState.hasOnboarded = true
        PrepMainView()
     setRootViewController(dummyViewController)
    }
    
}

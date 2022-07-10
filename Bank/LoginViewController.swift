//
//  ViewController.swift
//  Bank
//
//  Created by Asadullah Behlim on 09/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }
}
    extension LoginViewController {
        func style() {
            loginView.translatesAutoresizingMaskIntoConstraints = false
        }
        func layout() {
            view.addSubview(loginView)
            
            // Mark : Mark Autolayout Constraint
            
            NSLayoutConstraint.activate([
                        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                        loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                        view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
                    ])
            
        }
    }




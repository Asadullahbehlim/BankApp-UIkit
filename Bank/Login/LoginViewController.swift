//
//  ViewController.swift
//  Bank
//
//  Created by Asadullah Behlim on 09/07/22.
//

import UIKit

protocol LogoutDelegate {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
   func didlogin()
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let subtitleLabel = UILabel()
    weak var delegate : LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
}

extension LoginViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bank App"
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.text = " Your one stop solution for all banking needs !"

        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "Error Failure"
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
   private func layout() {
       view.addSubview(titleLabel)
       view.addSubview(loginView)
       view.addSubview(signInButton)
       view.addSubview(errorMessageLabel)
       view.addSubview(subtitleLabel)
      
       //titleLabel
       
       NSLayoutConstraint.activate([
        subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       ])
       
       //LoginView
       NSLayoutConstraint.activate([
        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
       ])
       
       //Button
       NSLayoutConstraint.activate ([
        signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
        signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
        signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
       ])
       
       //ErrorLabel
       NSLayoutConstraint.activate([
        errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
        errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
        errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
       ])
       
       //subtitleLabel
       
       NSLayoutConstraint.activate([
        loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
        subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
        subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
       ])
    }
}

// MARK: - Actions

    extension LoginViewController {
        @objc func signInTapped(sender: UIButton)  {
            errorMessageLabel.isHidden = true
            login()
        }
        
        private func login() {
        guard let username = username,
        let password = password
            else {
            assertionFailure("username/password should never be nil")
            return
           }
           
//            if username.isEmpty || password.isEmpty {
//                configureView(withMessage: "Username/Password Cannot Be Blank ")
//
//            }
//
            if username == "" && password == "" {
                signInButton.configuration?.showsActivityIndicator = true
                delegate?.didlogin()
                
            }
            else {
                configureView(withMessage: "Incorrect Username/Password")
            }
            
        }
       private func configureView(withMessage message: String) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message
        }
        
}
    

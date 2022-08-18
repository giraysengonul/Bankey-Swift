//
//  ViewController.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 18.08.2022.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - PROPERTIES
    let headLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    var username:String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}
// MARK: - Helpers
extension LoginViewController{
    private func style(){
        view.backgroundColor = .white
        //headLabel style
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        headLabel.text = "Bankey"
        headLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        headLabel.textColor = .black
        headLabel.adjustsFontSizeToFitWidth = true
        headLabel.textAlignment = .center
        view.addSubview(headLabel)
        //subTitle style
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.text = "Your premium for all things banking!"
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        subTitleLabel.textColor = .black
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 0
        subTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(subTitleLabel)
        //loginView style
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)
        //signInButton style
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        //errorMessageLabel style
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorMessageLabel)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Error failure"
        errorMessageLabel.isHidden = false
        
        
    }
    private func layout(){
        //loginView Layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        //signInButton Layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //errorMessageLabel Layout
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        //headLabel Layout
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: headLabel.bottomAnchor, multiplier: 2),
            headLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        //subTitleLabel Layout
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}
extension LoginViewController {
    @objc func signInTapped(){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username / password shoul never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password connot be blank.")
            return
        }
        if username == "Hakki" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

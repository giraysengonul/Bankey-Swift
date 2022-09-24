//
//  LoginView.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 18.08.2022.
//

import UIKit

class LoginView: UIView {
    // MARK: - PROPERTIES
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - HELPERS
extension LoginView{
    private func style() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        //stackView style
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        
        //usernameTextField style
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(usernameTextField)
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        //dividerView style
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        dividerView.backgroundColor = .secondarySystemFill
        stackView.addArrangedSubview(dividerView)
        //passwordTextField style
        passwordTextField.enablePasswordToggle()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        
    }
    private func layout() {
        //stackView Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        //dividerView Layout
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
}

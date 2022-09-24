//
//  UITextField+SecureToggle.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 24.09.2022.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)
extension UITextField{
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    @objc func togglePasswordView(_ sender: UIButton){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}

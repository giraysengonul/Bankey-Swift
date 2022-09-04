//
//  UIViewController+Utils.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import UIKit
extension UIViewController{
    
    func setStatusBar()  {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)
        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
    }
    
    func setTabBarImage(imageName: String,
                        title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

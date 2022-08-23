//
//  AppDelegate.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 18.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(onboardingContainerViewController)
        }else{
            setRootViewController(onboardingContainerViewController)
        }
    }
}
extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(loginViewController)
    }
}
extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.4, options: .transitionCrossDissolve, animations: nil)
    }
}

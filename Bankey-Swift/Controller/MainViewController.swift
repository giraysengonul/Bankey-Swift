//
//  MainViewController.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import UIKit
class MainViewController: UITabBarController{
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
}
// MARK: - Helpers
extension MainViewController{
    private func setupViews(){
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        summaryNC.navigationBar.barTintColor = appColor
        viewControllers = [summaryNC, moneyNC, moreNC]
    }
    private func setupTabBar(){
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }
}


class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

//
//  AccountSummaryViewController.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 21.09.2022.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    // MARK: - Properties
    private var tableView = UITableView()
    var accounts: [AccountSummaryCell.ViewModel] = []
    let array = [
        "a","b","c","d"
    ]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        fetchData()
    }
}
// MARK: - Helpers
extension AccountSummaryViewController{
    private func style(){
        //tableView Style
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        setupTableHeaderView()
    }
    private func layout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
    private func setupTableHeaderView(){
        let header = AccountSummaryHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
}
extension AccountSummaryViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        return cell
    }
}
extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                   accountName: "Basic Savings")
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                accountName: "Visa Avion Card")
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                      accountName: "Tax-Free Saver")
        
        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
    }
}

//
//  AccountSummaryCell.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 21.09.2022.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    // MARK: - Properties
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    let viewModel: ViewModel? = nil
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    let balanceStacView = UIStackView()
    let balanceLabel = UILabel()
    let balancaAmountLabel = UILabel()
    let chevronImageView = UIImageView()
    static let reuseID = "AcoountSummaryCell"
    static let rowHeight: CGFloat = 112
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension AccountSummaryCell{
    private func setup(){
        //typeLabel Setup
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Account Type"
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(typeLabel)
        //underlineView Setup
        underlineView.backgroundColor = appColor
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(underlineView)
        //nameLabel Setup
        nameLabel.text = "Account Name"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        //balanceStacView Setup
        balanceStacView.translatesAutoresizingMaskIntoConstraints = false
        balanceStacView.axis = .vertical
        balanceStacView.spacing = 0
        contentView.addSubview(balanceStacView)
        //balanceLabel Setup
        balanceLabel.text = "Some balance"
        balanceLabel.textAlignment = .right
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceStacView.addArrangedSubview(balanceLabel)
        //balancaAmountLabel Setup
        balancaAmountLabel.text = "$XXX,XXX.XX"
        balancaAmountLabel.textAlignment = .right
        balancaAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceStacView.addArrangedSubview(balancaAmountLabel)
        //chevronImageView Setup
        let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chevronImageView)
    }
    private func layout(){
        //typeLabel Layout
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        ])
        //underlineView Layout
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        //nameLabel Layout
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        ])
        //balanceStacView Layout
        NSLayoutConstraint.activate([
            balanceStacView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            balanceStacView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStacView.trailingAnchor, multiplier: 4)
        ])
        //chevronImageView Layout
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
extension AccountSummaryCell{
    func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balancaAmountLabel.attributedText = vm.balanceAsAttributedString
        switch vm.accountType{
        case .Banking:
            underlineView.backgroundColor = appColor
            balanceLabel.text = "Current balance"
        case .CreditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Current balance"
        case .Investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}


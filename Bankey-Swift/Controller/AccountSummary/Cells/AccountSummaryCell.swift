//
//  AccountSummaryCell.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 21.09.2022.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    // MARK: - Properties
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    let balanceStacView = UIStackView()
    let balanceLabel = UILabel()
    let balancaAmountLabel = UILabel()
    let chevronImageView = UIImageView()
    static let reuseID = "AcoountSummaryCell"
    static let rowHeight: CGFloat = 100
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
        balancaAmountLabel.text = "$929,446.63"
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
}

//
//  AccountSummaryHeaderView.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 21.09.2022.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    private func commonInit(){
        let bundle = Bundle(for: AccountSummaryViewController.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.backgroundColor = appColor
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
}

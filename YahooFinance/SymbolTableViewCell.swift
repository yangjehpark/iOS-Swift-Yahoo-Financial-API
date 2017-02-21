//
//  SymbolTableViewCell.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 21..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SymbolTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SymbolTableViewCellReuseIdentifier"
    static let expectedHeight: CGFloat = 60.0
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var symbolLabel:UILabel!
    
    func configure(result: Result) {
        self.nameLabel.text = (result.name ?? "")
        self.symbolLabel.text = (result.symbol ?? "")
    }
}

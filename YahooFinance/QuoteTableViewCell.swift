//
//  QuoteTableViewCell.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 21..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "QuoteTableViewCellReuseIdentifier"
    static let expectedHeight: CGFloat = 60.0
    
    @IBOutlet var keyLabel:UILabel!
    @IBOutlet var valueLabel:UILabel!
    
    func configure(index: Int, quote: Quote) {
        self.valueLabel.text = String(describing: Array(quote.toJSON().values)[index])
        self.keyLabel.text = Array(quote.toJSON().keys)[index]
    }
}

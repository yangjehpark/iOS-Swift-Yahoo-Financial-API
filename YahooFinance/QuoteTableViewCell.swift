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
    
}

//
//  QuoteTableViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class QuoteTableViewController: YahooFinanceViewController {
    
    static let identifier = "QuoteTableViewController"
    @IBOutlet weak var quoteTableView:UITableView!
    // In this sample case, the quotes has only one quote
    var quotes = [Quote]()
    let fixedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Quote"
        self.quoteTableView.delegate = self
        self.quoteTableView.dataSource = self
        self.quoteTableView.allowsSelection = false
    }

}

extension QuoteTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return QuoteTableViewCell.expectedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier, for: indexPath) as! QuoteTableViewCell
        cell.configure(index: indexPath.row, quote: self.quotes[self.fixedIndex])
        return cell
    }
}

extension QuoteTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quotes[fixedIndex].toJSON().count
    }
}

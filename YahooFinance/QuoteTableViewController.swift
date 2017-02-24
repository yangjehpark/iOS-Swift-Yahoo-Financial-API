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
    var viewModel: QuoteViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = self
        self.navigationItem.title = self.viewModel.getTexts(.title)
        self.quoteTableView.delegate = self
        self.quoteTableView.dataSource = self
        self.quoteTableView.allowsSelection = false
    }

}

extension QuoteTableViewController: QuoteViewModel {

    func refreshUI() {
        self.quoteTableView.reloadData()
    }
    
}
    
extension QuoteTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return QuoteTableViewCell.expectedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier, for: indexPath) as! QuoteTableViewCell
        cell.configure(index: indexPath.row, quote: self.viewModel.quotes[self.viewModel.fixedIndex])
        return cell
    }
}

extension QuoteTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.quotes[self.viewModel.fixedIndex].toJSON().count
    }
}

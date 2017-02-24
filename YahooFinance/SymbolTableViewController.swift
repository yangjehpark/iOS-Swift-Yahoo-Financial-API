//
//  SymbolTableViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SymbolTableViewController: YahooFinanceViewController {
    
    static let identifier = "SymbolTableViewController"
    @IBOutlet weak var symbolTableView:UITableView!
    var viewModel: SymbolViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = self
        self.navigationItem.title = self.viewModel.getTexts(.title)
        self.symbolTableView.delegate = self
        self.symbolTableView.dataSource = self
    }
    
}

extension SymbolTableViewController: SymbolViewModel {
    
    func refreshUI() {
        self.symbolTableView.reloadData()
    }
    
    func showLoading() {
        self.showLoadingView()
    }
    
    func hideLoading() {
        self.hideLoadingView()
    }
    
    func queryQuoteSuccess(quotes: [Quote]) {
        let quoteTableViewController = self.mainStoryboard.instantiateViewController(withIdentifier: QuoteTableViewController.identifier) as! QuoteTableViewController
        QuoteViewModelData.sharedData.quotes = quotes
        self.navigationController?.pushViewController(quoteTableViewController, animated: true)
    }
    
    func queryQuoteFail(error: NSError?) {
        self.showPopup(title: (error?.code != nil ? String(error!.code) : ""), message: self.viewModel.getTexts(.failMessage), completionHandler: { (complete) in
        
        })
    }

}

extension SymbolTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let symbol = self.viewModel.results[indexPath.row].symbol {
            self.viewModel.queryQuote(symbol)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SymbolTableViewCell.expectedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SymbolTableViewCell.reuseIdentifier, for: indexPath) as! SymbolTableViewCell
        cell.configure(result: self.viewModel.results[indexPath.row])
        return cell
    }
}

extension SymbolTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.results.count
    }
}

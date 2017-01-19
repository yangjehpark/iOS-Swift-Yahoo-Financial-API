//
//  SymbolTableViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SymbolTableViewController: YahooFinanceViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let identifier = "SymbolTableViewController"
    @IBOutlet weak var symbolTableView:UITableView!
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Symbol"
        self.symbolTableView.delegate = self
        self.symbolTableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SymbolTableViewCell.expectedHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SymbolTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! SymbolTableViewCell
        cell.nameLabel.text = self.results[indexPath.row].name
        cell.symbolLabel.text = self.results[indexPath.row].symbol
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let symbol = self.results[indexPath.row].symbol {
            self.queryQuote(symbol)
        }
    }
    
    func queryQuote(symbol:String) {
        self.showLoadingView()
        // Actually, You can put multiple symbols to query to each quotes at once.
        // But in this flow, just only one symbol is adjusted.
        QueryParser.query([symbol]) { (quotes, error) in
            self.hideLoadingView()
            if (quotes != nil) {
                self.pushToQuoteTableViewController(quotes!)
            } else {
                self.showPopup(title: (error?.code != nil ? String(error!.code) : ""), message: "Fail to Search Quote", completionHandler: { (complete) in
                    
                })
            }
        }
    }
    
    func pushToQuoteTableViewController(quotes:[Quote]) {
        let quoteTableViewController = self.mainStoryboard.instantiateViewControllerWithIdentifier(QuoteTableViewController.identifier) as! QuoteTableViewController
        quoteTableViewController.quotes = quotes
        self.navigationController?.pushViewController(quoteTableViewController, animated: true)
    }
}

class SymbolTableViewCell: UITableViewCell {
 
    static let reuseIdentifier = "SymbolTableViewCellReuseIdentifier"
    static let expectedHeight: CGFloat = 60.0
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var symbolLabel:UILabel!
    
    
}
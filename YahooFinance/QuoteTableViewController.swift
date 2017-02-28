//
//  QuoteTableViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class QuoteTableViewController: YahooFinanceViewController {
    
    static let identifier = "QuoteTableViewController"
    @IBOutlet weak var quoteTableView:UITableView!
    var viewModel: QuoteViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = self
        self.navigationItem.title = self.viewModel.getTexts(.title)
        
        self.setQuoteTableView()
        self.showQuoteTableView()
    }
    
    func setQuoteTableView() {
        self.quoteTableView.allowsSelection = false
    }

    func showQuoteTableView() {
        let quotes = Variable(self.viewModel.quotes)
        quotes.asObservable().bindTo(self.quoteTableView.rx.items(cellIdentifier: QuoteTableViewCell.reuseIdentifier, cellType: QuoteTableViewCell.self)) { (row, element, cell) in
            cell.valueLabel.text = String(describing: Array(element.toJSON().values)[row])
            cell.keyLabel.text = Array(element.toJSON().keys)[row]
        }.addDisposableTo(disposeBag)
    }
}

extension QuoteTableViewController: QuoteViewModel {

    func refreshUI() {
        self.showQuoteTableView()
    }
}
    

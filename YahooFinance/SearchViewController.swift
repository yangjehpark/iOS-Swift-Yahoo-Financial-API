//
//  SearchViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SearchViewController: YahooFinanceViewController, UISearchBarDelegate {

    static let identifier = "SearchViewControllerIdentifier"
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        self.searchBar.delegate = self
        self.searchBar.placeholder = "Any company name here."
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        if let searchBarText = searchBar.text, searchBarText != "" {
            self.searchSymbols(searchBarText)
        }
    }
    
    func searchSymbols(_ inputString: String) {
        self.showLoadingView()
        SearchParser.getSymbols(inputString) { (searchResults, error) in
            self.hideLoadingView()
            if (searchResults != nil) {
                if (searchResults!.count != 0) {
                    self.pushToSymbolTableViewController(searchResults!)
                } else {
                    self.showPopup(title: "Sorry", message: "Not Found", completionHandler: { (complete) in
                        if (complete) {
                            self.searchBar.becomeFirstResponder()
                        }
                    })
                }
            } else {
                self.showPopup(title: (error?.code != nil ? String(error!.code) : ""), message: "Fail to Search Symbol", completionHandler: { (complete) in
                    self.searchBar.becomeFirstResponder()
                })
            }
        }
    }
    
    func pushToSymbolTableViewController(_ searchResults:[Result]) {
        let symbolTableViewController = self.mainStoryboard.instantiateViewController(withIdentifier: SymbolTableViewController.identifier) as! SymbolTableViewController
        symbolTableViewController.results = searchResults
        self.navigationController?.pushViewController(symbolTableViewController, animated: true)
    }
}

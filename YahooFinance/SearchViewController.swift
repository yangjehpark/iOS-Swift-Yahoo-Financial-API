//
//  SearchViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SearchViewController: YahooFinanceViewController  {

    static let identifier = "SearchViewControllerIdentifier"
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        self.searchBar.delegate = self
        self.searchBar.placeholder = "Any company name here."
        self.viewModel = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.becomeFirstResponder()
    }
}

extension SearchViewController: SearchViewModel {
    
    func showLoading() {
        self.showLoadingView()
    }
    
    func hideLoading() {
        self.hideLoadingView()
    }
    
    func searchSuccess(results: [Result]) {
        let symbolTableViewController = self.mainStoryboard.instantiateViewController(withIdentifier: SymbolTableViewController.identifier) as! SymbolTableViewController
        symbolTableViewController.results = results
        self.navigationController?.pushViewController(symbolTableViewController, animated: true)
    }
    
    func searchFail(error: NSError?) {
        self.showPopup(title: (error?.code != nil ? String(error!.code) : "Sorry"), message: (error != nil ? "Fail to Search Symbol" : "Not Found"), completionHandler: { (complete) in
            self.searchBar.becomeFirstResponder()
        })
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        if let searchBarText = searchBar.text, searchBarText != "" {
            if (self.viewModel != nil) {
                self.viewModel!.searchStart(inputString: searchBarText)
            }
        }
    }
    
}

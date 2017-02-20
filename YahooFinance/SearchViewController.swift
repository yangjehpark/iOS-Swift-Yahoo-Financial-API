//
//  SearchViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class SearchViewController: YahooFinanceViewController, UISearchBarDelegate, SearchViewModelProtocol {

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
    
    /*
     MARK: UISearchBarDelegate
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        
        if let searchBarText = searchBar.text, searchBarText != "" {
            
            
            //self.searchViewModel?.searchStart(inputString: searchBarText)
        }
    }
    
    func showLoading() {
        self.showLoadingView()
    }
    
    func hideLoading() {
        self.hideLoadingView()
    }
    
    func searchSuccess(results: [Result]?) {
        if (results != nil) {
            let symbolTableViewController = self.mainStoryboard.instantiateViewController(withIdentifier: SymbolTableViewController.identifier) as! SymbolTableViewController
            symbolTableViewController.results = results!
            self.navigationController?.pushViewController(symbolTableViewController, animated: true)
        }
    }
    
    func searchFail(error: NSError?) {
        self.showPopup(title: (error?.code != nil ? String(error!.code) : "Sorry"), message: (error != nil ? "Fail to Search Symbol" : "Not Found"), completionHandler: { (complete) in
            self.searchBar.becomeFirstResponder()
        })
    }
    
}

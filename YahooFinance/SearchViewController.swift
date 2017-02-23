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
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = self
        self.navigationItem.title = self.viewModel.getTexts(.title)
        self.searchBar.delegate = self
        self.searchBar.placeholder = self.viewModel.getTexts(.placeholder)
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
        SymbolViewModelData.sharedData.results = results
        self.navigationController?.pushViewController(symbolTableViewController, animated: true)
    }
    
    func searchFail(error: NSError?) {
        let title = self.viewModel.getTexts(.failDefaultTitle)
        let failMessage = self.viewModel.getTexts(.failMessage)
        let failDefaultMessage = self.viewModel.getTexts(.failDefaultMessage)
        self.showPopup(title: (error?.code != nil ? String(error!.code) : title), message: (error != nil ? failMessage : failDefaultMessage), completionHandler: { (complete) in
            self.searchBar.becomeFirstResponder()
        })
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        if let searchBarText = searchBar.text, searchBarText != "" {
            self.viewModel.searchStart(inputString: searchBarText)
        }
    }
    
}

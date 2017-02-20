//
//  SearchViewModel.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 20..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

struct SearchViewModel {
    
    static func searchStart(model: SearchViewModel, inputString: String) {
        model.showLoading()
        
        SearchParser.getSymbols(inputString) { (searchResults, error) in
            model.hideLoading()
            if (searchResults != nil) {
                if (searchResults!.count != 0) {
                    model.searchSuccess(results: searchResults!)
                } else {
                    model.searchFail(error: error)
                }
            } else {
                model.searchFail(error: error)
            }
        }
    }
}

protocol SearchViewModelProtocol {
    
    func showLoading()
    func hideLoading()
    func searchSuccess(results: [Result]?)
    func searchFail(error: NSError?)
    
}

extension SearchViewModelProtocol {

}

//
//  SymbolViewModel.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 20..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import ObjectMapper

protocol SymbolViewModel: YahooFinanceViewModel {
    
    func refreshUI()
    func showLoading()
    func hideLoading()
    func queryQuoteSuccess(quotes: [Quote])
    func queryQuoteFail(error: NSError?)
}

extension SymbolViewModel {
    
    var results:[Result] {
        get {
            return SymbolViewModelData.sharedData.results
        }
        set {
            SymbolViewModelData.sharedData.results = newValue
            self.refreshUI()
        }
    }
    
    func getTexts(_ key: SymbolViewModelData.Texts) -> String {
        return key.rawValue
    }
    
    func queryQuote(_ symbol:String) {
        self.showLoading()
        // Actually, You can put multiple symbols to query to each quotes at once.
        // But in this flow, just only one symbol is adjusted.
        QueryParser.query([symbol]) { (quotes, error) in
            self.hideLoading()
            if (quotes != nil) {
                self.queryQuoteSuccess(quotes: quotes!)
            } else {
                self.queryQuoteFail(error: error)
            }
        }
    }
}


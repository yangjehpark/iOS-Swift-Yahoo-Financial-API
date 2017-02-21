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

protocol SymbolViewModel: YahooFinanceViewModel {
    
    func showLoading()
    func hideLoading()
    func queryQuoteSuccess(quotes: [Quote])
    func queryQuoteFail(error: NSError?)
}

extension SymbolViewModel {
    
    func getTexts(_ key: SymbolTableViewControllerTexts) -> String {
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

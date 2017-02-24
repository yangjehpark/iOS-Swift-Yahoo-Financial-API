//
//  QuoteViewModel.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 20..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol QuoteViewModel: YahooFinanceViewModel {
    
    func refreshUI()
}

extension QuoteViewModel {
    
    var fixedIndex: Int {
        get { return 0 }
    }
    
    var quotes:[Quote] {
        get {
            return QuoteViewModelData.sharedData.quotes
        }
        set {
            QuoteViewModelData.sharedData.quotes = newValue
            self.refreshUI()
        }
    }
    
    func getTexts(_ key: QuoteViewModelTexts) -> String {
        return key.rawValue
    }
    
}

final class QuoteViewModelData {
    static let sharedData = QuoteViewModelData()
    // In this sample case, the quotes has only one quote
    var quotes = [Quote]()
}

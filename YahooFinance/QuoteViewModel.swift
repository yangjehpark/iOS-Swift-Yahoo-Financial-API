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
    
}

extension QuoteViewModel {
    
    func getTexts(_ key: QuoteViewModelTexts) -> String {
        return key.rawValue
    }
    
}

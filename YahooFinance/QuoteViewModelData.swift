//
//  QuoteViewModelData.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 21..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import RxSwift

final class QuoteViewModelData {
    static let sharedData = QuoteViewModelData()
    // In this sample case, the quotes has only one quote
    var quotes: Variable<[Quote]> = Variable([Quote]())

    enum Texts: String {
        case title = "Quote"
        
    }
}

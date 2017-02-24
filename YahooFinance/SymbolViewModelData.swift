//
//  SymbolViewModelData.swift
//  YahooFinance
//
//  Created by 1000727 on 2017. 2. 21..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation

final class SymbolViewModelData {
    static let sharedData = SymbolViewModelData()
    
    var results = [Result]()
    
    enum Texts: String {
        case title = "Symbol"
        case failMessage = "Fail to Search Quote"
    }
}

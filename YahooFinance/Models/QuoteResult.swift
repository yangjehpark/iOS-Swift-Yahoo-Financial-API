//
//  QuoteResult.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 17..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct QuoteResult: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        self.quotes <- map["quote"]
        self.quote <- map["quote"]
    }
    
    var quotes: [Quote]?
    var quote: Quote? {
        didSet {
            // In case of the number of quote is 1, and the unity, append the object to 'quotes'
            if (quote != nil) {
                self.quotes = [Quote]()
                self.quotes!.append(quote!)
                self.quote = nil
            }
        }
    }
    
}

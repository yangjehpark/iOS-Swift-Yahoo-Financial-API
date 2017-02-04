//
//  QuoteJSON.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 17..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct QuoteJSON: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        self.query <- map["query"]
        self.error <- map["error"]
    }
    
    var query: QuoteQuery?
    var error: Error?
}

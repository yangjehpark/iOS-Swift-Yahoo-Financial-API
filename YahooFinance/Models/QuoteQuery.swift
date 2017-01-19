//
//  QuoteQuery.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 17..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

class QuoteQuery: Mappable {
    
    required init?(_ map: Map){
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        self.count <- map["count"]
        self.created <- map["created"]
        self.lang <- map["lang"]
        self.results <- map["results"]
    
    }
    
    var count: Int?
    var created: String?
    var lang: String?
    var results: QuoteResult?
}
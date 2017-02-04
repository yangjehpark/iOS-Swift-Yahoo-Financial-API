//
//  ResultSet.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 13..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResultSet: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        self.query <- map["Query"]
        self.results <- map["Result"]
    }
    
    var query: String?
    var results: [Result]?
}

//
//  Result.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 13..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct Result: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    var typeDisp: String?
    var symbol: String?
    var exchDisp: String?
    var name: String?
    var exch: String?
    var type: String?
    
    mutating func mapping(map: Map) {
        self.symbol <- map["symbol"]
        self.name <- map["name"]
        self.exch <- map["exch"]
        self.type <- map["type"]
        self.typeDisp <- map["typeDisp"]
        self.exchDisp <- map["exchDisp"]
    }
}

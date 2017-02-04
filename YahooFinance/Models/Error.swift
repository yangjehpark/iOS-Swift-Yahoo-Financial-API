//
//  CurrencyError.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 13..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct Error: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        self.lang <- map["lang"]
        self.description <- map["description"]
        self.message <- map["message"]
        self.code <- map["code"]
    }
    
    var lang: String?
    var description: String?
    var message: String?
    var code: Int?
}

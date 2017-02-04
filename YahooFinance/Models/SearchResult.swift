//
//  SearchResult.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 13..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResult: Mappable {
    
    init?(map: Map){
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        self.resultSet <- map["ResultSet"]
    }
    
    var resultSet: ResultSet?
}

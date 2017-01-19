//
//  SearchParser.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 13..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import Alamofire

class SearchParser {
    
    class func getSymbols(searchString: String, completionHandler: (searchResults: [Result]?, error: NSError?) -> Void)  {
        
        var queryString = searchString
        
        if let encoded = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet()) {
            queryString = encoded
        }
        
        let responseObjectType = SearchResult()
        
        let urlString = "https://s.yimg.com/aq/autoc?query=\(queryString)&region=US&lang=en-US"

        Parser.requestAndResponseObject(Method.GET, urlString: urlString, responseObjectType: responseObjectType) { (responseObject, error) in
            
            if (responseObject?.resultSet?.results != nil) {
                completionHandler(searchResults: responseObject!.resultSet!.results!, error: nil)
            } else {
                completionHandler(searchResults: nil, error: error)
            }
        }
    }
}
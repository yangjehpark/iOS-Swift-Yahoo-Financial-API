//
//  QueryParser.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 16..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import Alamofire

class QueryParser {
    
    class func query(symbolTray:[String]?, completionHandler: (quotes:[Quote]?, error:NSError?) -> Void) {
        
        if let symbolsString = QueryParser.symbolTrayToQueryString(symbolTray) {
            
            // The url is start with http, not https. So you must regist 'http://query.yahooapis.com' 'on 'Info.plist' at 'App Transport Security Settings'
            let urlString = "http://query.yahooapis.com/v1/public/yql?q=env%20%27store://datatables.org/alltableswithkeys%27%3B%20select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(\(symbolsString))%0A%09%09&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"
            // fixed issue by http://stackoverflow.com/questions/31014168/yql-console-no-definition-found-for-table-yahoo-finance-quotes
            
            let responseObjectType = QuoteJSON()
            
            Parser.requestAndResponseObject(Method.GET, urlString: urlString, parameters: nil, encoding: ParameterEncoding.JSON, headers: nil, responseObjectType: responseObjectType) { (responseObject, error) in
                if (responseObject?.query?.results?.quotes != nil) {
                    completionHandler(quotes: responseObject!.query!.results!.quotes!, error: nil)
                } else {
                    completionHandler(quotes: nil, error: error)
                }
            }
        } else {
            completionHandler(quotes: nil, error: nil)
        }
    }
    
    class private func symbolTrayToQueryString(tray: [String]?) -> String? {
        
        var symbolsString = ""
        
        if (tray != nil && tray!.count > 0) {
            for i in 0..<tray!.count {
                symbolsString = symbolsString+"%22"+tray![i]+"%22"
                if (i != tray!.count-1) {
                    symbolsString = symbolsString+"%2C"
                }
            }
        } else {
            return nil
        }
        return symbolsString
    }
}
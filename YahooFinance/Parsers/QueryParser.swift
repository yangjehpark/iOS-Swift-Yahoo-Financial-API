//
//  QueryParser.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 16..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import Alamofire

class QueryParser: Parser {
    
    class func query(_ symbolTray:[String]?, completionHandler: @escaping (_ quotes:[Quote]?, _ error:NSError?) -> Void) {
        
        if let symbolsString = QueryParser.symbolTrayToQueryString(symbolTray) {
            
            // The url is start with http, not https. So you must regist 'http://query.yahooapis.com' 'on 'Info.plist' at 'App Transport Security Settings'
            let urlString = "http://query.yahooapis.com/v1/public/"
            let format = "json"
            let env = "http://datatables.org/alltables.env".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
            let prefixString = "yql?"+"&format="+format+"&env="+env
            let queryString = "&q=env%20%27store://datatables.org/alltableswithkeys%27%3B%20select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20("+symbolsString+")%0A%09%09"
            // queryString <- fixed issue by http://stackoverflow.com/questions/31014168/yql-console-no-definition-found-for-table-yahoo-finance-quotes
            let finalUrlString = urlString+prefixString+queryString
            
            let responseObjectType = QuoteJSON()
            requestAndResponseObject(HTTPMethod.get, urlString: finalUrlString, parameters: nil, encoding: URLEncoding.queryString, headers: nil, responseObjectType: responseObjectType) { (responseObject, error) in
                if (responseObject?.query?.results?.quotes != nil) {
                    completionHandler(responseObject!.query!.results!.quotes!, nil)
                } else {
                    completionHandler(nil, error)
                }
            }
        } else {
            completionHandler(nil, nil)
        }
    }
    
    class fileprivate func symbolTrayToQueryString(_ tray: [String]?) -> String? {
        
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

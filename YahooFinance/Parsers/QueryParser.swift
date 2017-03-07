//
//  QueryParser.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 16..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class QueryParser: Parser {
    
    class func query(_ symbolTray:[String]?, completionHandler: @escaping (_ quotes:[Quote]?, _ error:NSError?) -> Void) {
        
        if let symbolsString = QueryParser.symbolTrayToQueryString(symbolTray) {
            
            // The url is start with http, not https. So you must regist 'http://query.yahooapis.com' 'on 'Info.plist' at 'App Transport Security Settings'
            let urlString = "http://query.yahooapis.com/v1/public/"
            
            let format = "json"
            let env = "store://datatables.org/alltableswithkeys".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
            let prefixString = "yql?"+"&format="+format+"&env="+env
            
            let yqlStatement = ("select * from yahoo.finance.quotes where symbol in ("+symbolsString+")").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
            let queryString = "&q="+yqlStatement
            
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
        
        if (tray != nil && tray!.count > 0) {
            return tray!.reduce("") { (result:String, string:String) -> String in
                return (result != "" ? result+","+string : "\""+string+"\"")
            }
        } else {
            return nil
        }
    }
}

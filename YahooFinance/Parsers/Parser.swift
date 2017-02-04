//
//  Parser.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 12..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ReachabilitySwift

class Parser {
    
    class func checkNetwork() ->  Bool {
        if let reach = Reachability() {
            return reach.isReachable
        } else {
            return false
        }
    }
    
    class func requestAndResponseObject<T:Mappable>(_ method: HTTPMethod, urlString: String, parameters: [String: AnyObject]? = nil, encoding: URLEncoding = URLEncoding.queryString, headers: [String: String]? = nil, responseObjectType: T, completionHandler: @escaping (_ responseObject: T?, _ error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            
            request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers).responseObject(completionHandler: { (response:DataResponse<T>?) -> Void in
                
                if (response!.response?.statusCode != 200 && (response!.result.value == nil || response!.result.value?.toJSON().count == 0)) {
                    completionHandler(nil, response!.result.error as NSError?)
                    return
                }

                if (response != nil && response!.result.value != nil) {
                    completionHandler(response!.result.value!, nil)
                } else {
                    completionHandler(nil, response!.result.error as NSError?)
                }
            })
        } else {
            completionHandler(nil, nil)
        }
    }
    
    class func requestAndResponseArray<T:Mappable>(_ method: HTTPMethod, urlString: String, parameters: [String: AnyObject]? = nil, encoding: URLEncoding = URLEncoding.queryString, headers: [String: String]? = nil, responseArrayType: [T], completionHandler: @escaping (_ responseArray: [T]?, _ error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers).responseArray(completionHandler: { (response:DataResponse<[T]>) in
                
                if (response.response?.statusCode != 200 && (response.result.value == nil || response.result.value?.toJSON().count == 0)) {
                    completionHandler(nil, response.result.error as NSError?)
                    return
                }
                
                if (response.result.value != nil) {
                    completionHandler(response.result.value!, nil)
                } else {
                    completionHandler(nil, response.result.error as NSError?)
                }
            })
        } else {
            completionHandler(nil, nil)
        }
    }    
}

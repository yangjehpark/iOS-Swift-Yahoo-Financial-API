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

class Parser {
    
    class func checkNetwork() ->  Bool {
        do {
            let reachability: Reachability = try Reachability.reachabilityForInternetConnection()
            return reachability.isReachable()
        } catch {
            return false
        }
    }
    
    class func requestAndResponseObject<T:Mappable>(method: Alamofire.Method, urlString: String, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = .URL, headers: [String: String]? = nil, responseObjectType: T, completionHandler: (responseObject: T?, error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            
            request(method, urlString, parameters: parameters, encoding: encoding, headers: headers).responseObject(completionHandler: { (response:Response<T, NSError>?) -> Void in
                
                if (response!.response?.statusCode != 200 && (response!.result.value == nil || response!.result.value?.toJSON().count == 0)) {
                    completionHandler(responseObject: nil, error: response!.result.error)
                    return
                }

                if (response != nil && response!.result.value != nil) {
                    completionHandler(responseObject: response!.result.value!, error: nil)
                } else {
                    completionHandler(responseObject: nil, error: response!.result.error)
                }
            })
        } else {
            completionHandler(responseObject: nil, error: nil)
        }
    }
    
    class func requestAndResponseArray<T:Mappable>(method: Alamofire.Method, urlString: String, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = .URL, headers: [String: String]? = nil, responseArrayType: [T], completionHandler: (responseArray: [T]?, error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            request(method, urlString, parameters: parameters, encoding: encoding, headers: headers).responseArray {(response:Response<[T], NSError>) -> Void in
                
                if (response.response?.statusCode != 200 && (response.result.value == nil || response.result.value?.toJSON().count == 0)) {
                    completionHandler(responseArray: nil, error: response.result.error)
                    return
                }
                
                if (response.result.value != nil) {
                    completionHandler(responseArray: response.result.value!, error: nil)
                } else {
                    completionHandler(responseArray: nil, error: response.result.error)
                }
            }
        } else {
            completionHandler(responseArray: nil, error: nil)
        }
    }    
}
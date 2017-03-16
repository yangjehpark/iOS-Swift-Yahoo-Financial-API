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
import RxSwift

class Parser {
    
    static let disposeBag = DisposeBag()
    
    class func checkNetwork() ->  Bool {
        if let reach = Reachability() {
            return reach.isReachable
        } else {
            return false
        }
    }
    
    class func requestAndResponseObject<T:Mappable>(_ method: HTTPMethod, urlString: String, parameters: [String: AnyObject]? = nil, encoding: URLEncoding = URLEncoding.queryString, headers: [String: String]? = nil, responseObjectType: T, completionHandler: @escaping (_ responseObject: T?, _ error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            request(urlString, method: method , parameters: parameters , encoding: encoding, headers: headers).rx_responseObject(type: responseObjectType).subscribe(onNext: { (mappable:Mappable) in
                completionHandler((mappable as! T), nil)
            }, onError: { (error:Error) in
                completionHandler(nil, (error as NSError))
            }, onCompleted: {
                
            }, onDisposed: {
                
            }).addDisposableTo(disposeBag)
        } else {
            completionHandler(nil, nil)
        }
    }
    
    class func requestAndResponseArray<T:Mappable>(_ method: HTTPMethod, urlString: String, parameters: [String: AnyObject]? = nil, encoding: URLEncoding = URLEncoding.queryString, headers: [String: String]? = nil, responseArrayType: [T], completionHandler: @escaping (_ responseArray: [T]?, _ error:NSError?) -> Void) {
        
        if (Parser.checkNetwork()) {
            request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers).rx_responseArray(type: responseArrayType).subscribe(onNext: { (mappable:Mappable) in
                completionHandler((mappable as! [T]), nil)
            }, onError: { (error:Error) in
                completionHandler(nil, (error as NSError))
            }, onCompleted: { 
                
            }, onDisposed: { 
                
            }).addDisposableTo(disposeBag)
        } else {
            completionHandler(nil, nil)
        }
    }    
}

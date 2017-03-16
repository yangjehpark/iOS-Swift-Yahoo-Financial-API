//
//  RxAlamofireMapper.swift
//  RxAlamofireMapper
//
//  Created by Wassim Seifeddine on 2/20/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//
//  https://github.com/wassimseif/RxAlamofireMapper
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

public typealias JSON = [String : Any]

public enum ObjectMapError: Error{
    case MapError(JSON?)
    case APIResponseError(Any)
    
}

extension DataRequest{
    
    private func processMap<N>(mapObject:@escaping (AnyObject) -> N?) -> Observable<N> {
        
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.MapError(response.result.value as? JSON)))
                        return
                    }
                    observer.on(Event.next(o))
                case .failure :
                    observer.on(Event.error(ObjectMapError.APIResponseError(response.result.value as? JSON)))
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    public func rx_responseArray<T:Mappable>(type: [T]) -> Observable<T> {
        return self.processMap(mapObject: { (json) in
            Mapper<T>().map(JSON: json as! JSON)
        })
    }
    
    public func rx_responseObject<T:Mappable>(type: T) -> Observable<T> {
        return self.processMap(mapObject: { (json) in
            Mapper<T>().map(JSON: json as! [String : Any] )
        })
    }
}

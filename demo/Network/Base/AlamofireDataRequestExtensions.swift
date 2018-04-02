//
//  AlamofireDataRequestExtensions.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

/**
 *
 * Helper extension to integrate RxSwift with Alamofire
 *
 */
public typealias JSON = [String : Any]
public let ParsingErrorCode: Int = 555
public let UnAuthorized: Int = 401

public enum ObjectMapError: Error{
    case ErrorCodeValue(Int)
}

extension DataRequest{
    
    public func processMap<N>(mapObject:@escaping (AnyObject)->N?) -> Observable<N>{
        
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                        return
                    }
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.next(o))
                    }
                case .failure :
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    public func rx_responseArray<T:Mappable>(type:T.Type) -> Observable<[T]>{
        return self.processMap(mapObject: { (json) in
            if let json = json as? [JSON]{
                return Mapper<T>().mapArray(JSONArray: json)
            }else{
                return  Mapper<T>().mapArray(JSONArray: [])
            }
        })
    }
    
    public func rx_responseObject<T:Mappable>(type:T.Type) -> Observable<T>{
        return self.processMap(mapObject: { (json) in
            if let json = json as? [String : Any] {
                return Mapper<T>().map(JSON: json)
            }else{
                return Mapper<T>().map(JSON: [:])
            }
        })
    }
    
    public func rx_responseString() -> Observable<String>{
        return Observable.create{ (observer) -> Disposable in
            
            self.responseString(completionHandler: { response in
                switch response.result {
                case .success :
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.next(response.result.value ?? ""))
                    }
                case .failure :
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
}

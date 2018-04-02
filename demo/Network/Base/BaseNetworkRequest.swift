//
//  BaseNetworkRequest.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper

class BaseNetworkRequest: NSObject{
    
    public override init() {
        super.init()
    }
    
    public func getResponseString(url: String) -> Observable<String>{
        let url = URL(string: url)
        let alamofireRequest = RxAlamofire.request(getMethodType(),
                                                   url!,
                                                   parameters: getParameters(),
                                                   encoding: getEncoding(),
                                                   headers: getHeaders())
        
        let observable = alamofireRequest.flatMap{
            $0.rx_responseString()
        }
        return observable
    }
    
    func getEncoding() -> ParameterEncoding{
        if (getMethodType() == .post || getMethodType() == .put){
            return JSONEncoding.default
        }
        return URLEncoding.default
    }
    
    func getMethodType() -> HTTPMethod {
        return .get
    }
    
    func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        return headers
    }
    
    func getParameters() -> Parameters {
        return [:]
    }
}


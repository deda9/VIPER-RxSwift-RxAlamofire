//
//  Placemark.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

public class Placemark: Mappable{
    
    var address : String?
    var coordinates : [AnyObject]?
    var engineType : String?
    var exterior : String?
    var fuel : Int?
    var interior : String?
    var name : String?
    var vin : String?
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        address     <- map["address"]
        coordinates <- map["coordinates"]
        engineType  <- map["engineType"]
        exterior    <- map["exterior"]
        fuel        <- map["fuel"]
        interior    <- map["interior"]
        name        <- map["name"]
        vin         <- map["vin"]
    }
    
}

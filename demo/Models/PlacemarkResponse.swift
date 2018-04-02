//
//  PlacemarkResponse.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

public class PlacemarkResponse: Mappable{
    
    var placemarksList : [Placemark]?
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        placemarksList <- map["placemarks"]
    }
}

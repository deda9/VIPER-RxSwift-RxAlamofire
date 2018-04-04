//
//  Placemark.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

public class Placemark: Mappable{
    
    private var _address : String?
    private var _coordinates : [Double]?
    private var _engineType : String?
    private var _exterior : String?
    private var _fuel : Int?
    private var _interior : String?
    private var _name : String?
    private var _vin : String?
    
    var allInfoInOneLine: String{
        var text = engineType
        text += ", "
        text += exterior
        text += ", "
        text += fuel.toString()
        text += ", "
        text += interior
        return text
    }
    
    var address : String{
        return _address ?? ""
    }
    
    var coordinates : [Double]{
        return _coordinates ?? []
    }
    
    var late: Double{
        if coordinates.count > 0{
            return coordinates[0]
        }
        return 0.0
    }
    
    var long: Double{
        if coordinates.count > 1{
            return coordinates[1]
        }
        return 0.0
    }
    
    var engineType : String {
        return _engineType ?? ""
    }
    
    var exterior : String{
        return _exterior ?? ""
    }
    
    var fuel : Int{
        return _fuel ?? 0
    }
    
    var interior : String{
        return _interior ?? ""
    }
    
    var name : String{
        return _name ?? ""
    }
    
    var vin : String{
        return _vin ?? ""
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _address     <- map["address"]
        _coordinates <- map["coordinates"]
        _engineType  <- map["engineType"]
        _exterior    <- map["exterior"]
        _fuel        <- map["fuel"]
        _interior    <- map["interior"]
        _name        <- map["name"]
        _vin         <- map["vin"]
    }
    
}

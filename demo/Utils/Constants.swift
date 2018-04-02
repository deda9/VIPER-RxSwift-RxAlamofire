//
//  Constants.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

enum Servers{
    public static let DEV = "https://s3-us-west-2.amazonaws.com/wunderbucket/"
}

class Constants{
    public static let BASE_URL = Servers.DEV
}

enum APIPath: String{
    case locations = "locations.json"
    
    var path: String{
        return Constants.BASE_URL + rawValue
    }
}

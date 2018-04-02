//
//  PlacemarkListService.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import RxSwift
import Alamofire

class PlacemarkListService: BaseMappableNetworkRequest<PlacemarkResponse>{
    
    func getPlacemarkList() -> Observable<PlacemarkResponse>{
        return getResponseObject(url: APIPath.locations.path)
    }
}

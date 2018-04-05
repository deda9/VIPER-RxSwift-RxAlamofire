//
//  CarTabViewInterface.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol PlaceMarkTabViewInput: class {
    
    func showLoadingCarsError(_ message: String)
    
    func showLoadingCars()
    
    func showCars(for: [Placemark])
    
    func hideLoadingCars()
}

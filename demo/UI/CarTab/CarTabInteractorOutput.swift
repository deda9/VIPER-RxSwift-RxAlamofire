//
//  CarTabInteractorOutput.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol CarTabInteractorOutput: class {
    
    func showLoadingCars()
    
    func hideLoadingCars()
    
    func showCars(for: [Placemark])
    
    func showLoadingCarsError(_ message: String)
}

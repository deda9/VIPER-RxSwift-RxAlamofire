//
//  CarTabPresenter.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

class PlaceMarkPresenter: PlaceMarkTabPresenterInput{
    
    weak var carView: PlaceMarkTabViewInput?
    var intractor: PlaceMarkInteractorInput!
    
    func viewDidLoad() {
        intractor.getCarsList()
    }
}

//MARK: CarTabInteractorOutput
extension PlaceMarkPresenter: PlaceMarkInteractorOutput{
    
    func showLoadingCarsError(_ message: String) {
        carView?.showLoadingCarsError(message)
    }
    
    func showCars(for list: [Placemark]){
        carView?.showCars(for: list)
    }
    
    func showLoadingCars(){
        carView?.showLoadingCars()
    }
    
    func hideLoadingCars(){
        carView?.hideLoadingCars()
    }
}

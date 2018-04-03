//
//  CarTabPresenter.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

class CarTabPresenter: CarTabPresenterInput{
    
    weak var carView: CarTabViewInput?
    var carIntractor: CarTabInteractorInput!
    
    func viewDidLoad() {
        carIntractor.getCarsList()
    }
}

//MARK: CarTabInteractorOutput
extension CarTabPresenter: CarTabInteractorOutput{
    
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

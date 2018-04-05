//
//  CarTabInteractor.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import RxCocoa
import RxSwift

class PlaceMarkInteractor: PlaceMarkInteractorInput{
    
    weak var output: PlaceMarkInteractorOutput?
    private var placeMarkService = PlacemarkListService()
    private var disposeBag = DisposeBag()
    
    /**
     * Call the network request to get all the placemarks
     */
    func getCarsList(){
        output?.showLoadingCars()
        
        placeMarkService.getPlacemarkList().subscribe(onNext: { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.output?.hideLoadingCars()
            strongSelf.output?.showCars(for: response.placemarksList)
            
        }, onError: { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.output?.hideLoadingCars()
            strongSelf.output?.showLoadingCarsError(AppUtils.localizedString(forKey: "someThingIsWrong"))
        }).disposed(by: disposeBag)
    }
}

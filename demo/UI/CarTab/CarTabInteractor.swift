//
//  CarTabInteractor.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import RxCocoa
import RxSwift

class CarTabInteractor: CarTabInteractorInput{
    
    weak var output: CarTabInteractorOutput?
    private var placeMarkService = PlacemarkListService()
    private var disposeBag = DisposeBag()
    
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

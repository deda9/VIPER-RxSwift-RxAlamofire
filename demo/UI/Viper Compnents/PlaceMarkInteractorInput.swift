//
//  CarTabInteractorInput.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol PlaceMarkInteractorInput: class {
    
    weak var output: PlaceMarkInteractorOutput? { get set }

    func getCarsList()
}

//
//  CarTabInteractorInput.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol CarTabInteractorInput: class {
    
    weak var output: CarTabInteractorOutput? { get set }

    func getCarsList()
}

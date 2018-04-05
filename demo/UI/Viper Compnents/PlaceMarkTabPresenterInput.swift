//
//  CarTabPresenterInterface.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol PlaceMarkTabPresenterInput: class {
    
    var intractor: PlaceMarkInteractorInput! { get set }
    
    weak var carView: PlaceMarkTabViewInput? { get set }
    
    func viewDidLoad()
}

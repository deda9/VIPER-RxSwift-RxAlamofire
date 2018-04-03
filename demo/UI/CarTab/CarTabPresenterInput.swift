//
//  CarTabPresenterInterface.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

protocol CarTabPresenterInput: class {
    
    var carIntractor: CarTabInteractorInput! { get set }
    
    weak var carView: CarTabViewInput? { get set }
    
    func viewDidLoad()
}

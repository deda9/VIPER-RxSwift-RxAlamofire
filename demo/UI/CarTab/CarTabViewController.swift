//
//  CarTabViewController.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit

class CarTabViewController: BaseViewController{
    
    @IBOutlet var dataSource: CarTableViewDataSource!
    @IBOutlet weak var carsTableView: UITableView!
    
    private var presenter: CarTabPresenterInput!
    private var carIntractor: CarTabInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        initializePresenter()
        presenter.viewDidLoad()
    }
    
    private func initializePresenter(){
        presenter = CarTabPresenter()
        carIntractor = CarTabInteractor()
        carIntractor.output = presenter as? CarTabInteractorOutput
        presenter.carView = self
        presenter.carIntractor = carIntractor
    }
    
    private func prepareTableView(){
        carsTableView.estimatedRowHeight = 100
        carsTableView.dataSource = dataSource
        carsTableView.delegate = dataSource
    }
}

//MARK: CarTabViewInput
extension CarTabViewController: CarTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
        showLoadingView(self.carsTableView)
    }
    
    func showCars(for list: [Placemark]){
        dataSource.setPlaceMarkList(list)
        carsTableView.reloadData()
    }
    
    func hideLoadingCars(){
        hideLoadingView(self.carsTableView)
    }
}

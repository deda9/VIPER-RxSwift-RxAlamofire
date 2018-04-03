//
//  MapTabViewController.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit
import MapKit

class MapTabViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var presenter: PlaceMarkTabPresenterInput!
    private var carIntractor: PlaceMarkInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePresenter()
        presenter.viewDidLoad()
    }
    
    private func initializePresenter(){
        presenter = PlaceMarkPresenter()
        carIntractor = PlaceMarkInteractor()
        carIntractor.output = presenter as? PlaceMarkInteractorOutput
        presenter.carView = self
        presenter.intractor = carIntractor
    }
}

//MARK: PlaceMarkTabViewInput
extension MapTabViewController: PlaceMarkTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
    }
    
    func showCars(for list: [Placemark]){
    }
    
    func hideLoadingCars(){
    }
}

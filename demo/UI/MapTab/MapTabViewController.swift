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
        setMapViewDelegate()
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
    
    private func setMapViewDelegate(){
        mapView.delegate = self
    }
}

//MARK: PlaceMarkTabViewInput
extension MapTabViewController: PlaceMarkTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
        self.mapView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        activityIndicatorView.centerParent(of: self.mapView)
    }
    
    func showCars(for list: [Placemark]){
        list.forEach{
            addAnnotationForMapView(CLLocation.init(latitude: $0.late, longitude: $0.long), address: $0.address)
        }
    }
    
    func hideLoadingCars(){
        if activityIndicatorView.isDescendant(of: self.view) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
        }
    }
}

//MARK: MKMapViewDelegate
extension MapTabViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if (annotation is MKUserLocation) {
            return nil
        }
        let reuseID = "annotationID"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        if annotationView == nil {
            annotationView =  MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            annotationView?.image = UIImage(named: "ic_marker")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.isSelected = true
        annotationView?.setSelected(true, animated: true)
        return annotationView
    }
    
    fileprivate func addAnnotationForMapView(_ location: CLLocation?, address locationAddress: String = ""){
        if let coordinates = location?.coordinate{
            let mapAnnotation = MKPointAnnotation()
            mapAnnotation.title = locationAddress
            mapAnnotation.coordinate = coordinates
            mapView.addAnnotation(mapAnnotation)
            mapView.selectAnnotation(mapAnnotation, animated: true)
        }
    }
}

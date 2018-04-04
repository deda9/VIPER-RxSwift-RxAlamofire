//
//  MapTabViewControllerTests.swift
//  demoTests
//
//  Created by Bassem Qoulta on 4/5/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble

@testable import demo
class MapTabViewControllerTests: QuickSpec {
    
    override func spec() {
        var sutResponse: PlacemarkResponse!
        var sutViewController: MapTabViewController!
        
        beforeEach {
            sutResponse = TestHelper().getPlacemarkResponseMock()
            sutViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MapTabViewController") as! MapTabViewController
        }
        
        describe("MapTabViewController initialization") {
            
            beforeEach {
                _ = sutViewController.view
            }
            
            it("MapView must not equal nil") {
                expect(sutViewController.mapView).notTo(beNil())
            }
            
            it("MapView annotations count must equal placemarksList count") {
                sutViewController.showCars(for: sutResponse.placemarksList)
                expect(sutViewController.mapView.annotations.count).to(equal(sutResponse.placemarksList.count))
            }
            
            it("MapView first annotation title must not equal nil") {
                sutViewController.showCars(for: sutResponse.placemarksList)
                expect(sutViewController.mapView.annotations[0].title).notTo(beNil())
            }
        }
    }
}

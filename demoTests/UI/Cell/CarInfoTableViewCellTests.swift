//
//  CarInfoTableViewCellTests.swift
//  demoTests
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble

@testable import demo
class CarInfoTableViewCellTests: QuickSpec {
    
    override func spec() {
        var sutTableViewDelegate: CarTableViewDataSource!
        var sutResponse: PlacemarkResponse!
        var sutCell: CarInfoTableViewCell!
        var sutCarViewController: CarTabViewController!
        
        beforeEach {
            sutTableViewDelegate = CarTableViewDataSource()
            sutResponse = TestHelper().getPlacemarkResponseMock()
            sutCell = CarInfoTableViewCell(style: .default, reuseIdentifier: CarInfoTableViewCell.ID)
            
            sutCarViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "CarTabViewController") as! CarTabViewController
            
            sutTableViewDelegate.setPlaceMarkList(sutResponse.placemarksList!)
        }
        
        describe("CarInfoTableViewCell initialization") {
            
            beforeEach {
                _ = sutCarViewController.view
                sutCarViewController.carsTableView.delegate = sutTableViewDelegate
                sutCarViewController.carsTableView.dataSource = sutTableViewDelegate
            }
            
            it("carTableView must not equal nil") {
                expect(sutCarViewController.carsTableView).notTo(beNil())
            }
            
            it("cell view must not equal nil") {
                let cell = getCarInfoTableViewCell()
                expect(cell).notTo(beNil())
            }
            
            it("cell Address Label must not equal nil") {
                let cell = getCarInfoTableViewCell()
                expect(cell.addressLabel).notTo(beNil())
            }
            
            it("cell Car Name Label must not equal nil") {
                let cell = getCarInfoTableViewCell()
                expect(cell.carNameLabel).notTo(beNil())
            }
            
            it("cell Car Name Label must equal HH-GO8522") {
                let cell = getCarInfoTableViewCell()
                expect(cell.carNameLabel.text).to(equal("HH-GO8522"))
            }
            
            it("cell Car Name Label must NOT equal HHs-sss") {
                let cell = getCarInfoTableViewCell()
                expect(cell.carNameLabel.text).notTo(equal("HHs-sss"))
            }
        }
        
        func getCarInfoTableViewCell() -> CarInfoTableViewCell{
            let indexPath = IndexPath.init(row: 0, section: 0)
            let cell = sutTableViewDelegate.tableView(sutCarViewController.carsTableView, cellForRowAt: indexPath) as! CarInfoTableViewCell
            return cell
        }
    }
    
    
}

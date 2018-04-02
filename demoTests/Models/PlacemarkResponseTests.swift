//
//  PlacemarkResponseTests.swift
//  demoTests
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper

@testable import demo
class PlacemarkResponseTests: QuickSpec {
    override func spec() {
        describe("PlacemarkResponse initialization") {
            var sutResponse: PlacemarkResponse!
            beforeEach {
                sutResponse = self.getPlacemarkResponseMock()
            }
            
            it("placemarksList must not be empty") {
                let placemarksListCount = sutResponse.placemarksList?.count
                expect(placemarksListCount).notTo(equal(0))
            }
            
            it("placemark initialization") {
                let placemark = sutResponse.placemarksList?[0]
                expect(placemark).notTo(beNil())
            }
            
            it("placemark name not equal nil") {
                let name = sutResponse.placemarksList?[0].name
                expect(name).notTo(beNil())
            }
            
            it("placemark name equal value") {
                let name = sutResponse.placemarksList?[0].name
                expect(name).to(equal("HH-GO8522"))
            }
            
            it("placemark address not equal nil") {
                let address = sutResponse.placemarksList?[0].address
                expect(address).notTo(beNil())
            }
            
            it("placemark address equal value") {
                let address = sutResponse.placemarksList?[0].address
                expect(address).to(equal("Lesserstraße 170, 22049 Hamburg"))
            }
            
            it("placemark address not equal value") {
                let address = sutResponse.placemarksList?[0].address
                expect(address).notTo(equal("dummy address"))
            }
            
            it("placemark engineType not equal nil") {
                let engineType = sutResponse.placemarksList?[0].engineType
                expect(engineType).notTo(beNil())
            }
       
            it("placemark exterior not equal nil") {
                let exterior = sutResponse.placemarksList?[0].exterior
                expect(exterior).notTo(beNil())
            }
            
            it("placemark fuel not equal nil") {
                let fuel = sutResponse.placemarksList?[0].fuel
                expect(fuel).notTo(beNil())
            }
            
            it("placemark vin not equal nil") {
                let vin = sutResponse.placemarksList?[0].vin
                expect(vin).notTo(beNil())
            }
        }
    }
    
    func getPlacemarkResponseMock() -> PlacemarkResponse?{
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "locations", ofType: "json")
        let pathUrl = "file://" + path!
        do {
            let jsonData = try Data(contentsOf: NSURL.init(string: pathUrl)! as URL, options: .alwaysMapped)
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else {
                return nil
            }
            return  Mapper<PlacemarkResponse>().map(JSON: json as! [String : Any])
            
        }catch(let error){
            print (error.localizedDescription)
        }
        return nil
    }
}

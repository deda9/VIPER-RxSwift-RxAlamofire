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
                let placemark = sutResponse.placemarksList?[0].name
                expect(placemark).notTo(beNil())
            }
            
            it("placemark name equal value") {
                let placemark = sutResponse.placemarksList?[0].name
                expect(placemark).to(equal("HH-GO8522"))
            }
            
            it("placemark address not equal nil") {
                let placemark = sutResponse.placemarksList?[0].address
                expect(placemark).notTo(beNil())
            }
            
            it("placemark address equal value") {
                let placemark = sutResponse.placemarksList?[0].address
                expect(placemark).to(equal("Lesserstraße 170, 22049 Hamburg"))
            }
            
            it("placemark address not equal value") {
                let placemark = sutResponse.placemarksList?[0].address
                expect(placemark).notTo(equal("dummy address"))
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

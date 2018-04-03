//
//  ConstantsTests.swift
//  demoTests
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble

@testable import demo
class ConstantsTests: QuickSpec {
    override func spec() {
        describe("test Constant initialization") {
            
            it("BASE URL must be initialized") {
                let baseURL = Constants.BASE_URL
                let actualBaseURL = "https://s3-us-west-2.amazonaws.com/wunderbucket/"
                expect(baseURL).to(equal(actualBaseURL))
            }
            
            it("Location endPoint must must be initialized") {
                let actualLocationEndPoint = "https://s3-us-west-2.amazonaws.com/wunderbucket/locations.json"
                let locationEndPoint = APIPath.locations.path
                expect(locationEndPoint).to(equal(actualLocationEndPoint))
            }
            
        }
    }
}

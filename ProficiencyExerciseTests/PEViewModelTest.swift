//
//  PEViewModelTest.swift
//  ProficiencyExerciseTests
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import XCTest
@testable import ProficiencyExercise

class PEViewModelTest: XCTestCase {
    var viewmodelMock = PEViewModel()
    
    override func setUp() {
    }
    
    func testgetFactData(){
        let responseJson = """
{
        "title":"About Canada",
        "rows":[
            {
            "title":"Beavers",
            "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
            "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
            },
            {
            "title":"Flag",
            "description":null,
            "imageHref":"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"
            },
            {
            "title":"Transportation",
            "description":"It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.",
            "imageHref":"http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg"
            }]
"""
        
        MockURLProtocol.resposnseWithSuccess(data: responseJson.data(using: .utf8)!)
        let expectataion = self.expectation(description: "Wait for service call")
        let expectTime :Double = 3
        viewmodelMock.getFactData{(isfetched)in
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + expectTime){
            expectataion.fulfill()
        }
        waitForExpectations(timeout: expectTime+1)
        XCTAssertNotNil(viewmodelMock.factDetails)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

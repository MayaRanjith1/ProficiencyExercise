//
//  PEFactsViewControllerTest.swift
//  ProficiencyExerciseTests
//
//  Created by Maya Ranjith  on 29/07/20.
//

import XCTest
@testable import ProficiencyExercise

class PEFactsViewControllerTest: XCTestCase {
    
    var vcMock = PEFactsViewController()

    override func setUp() {
        super.setUp()
        vcMock.tableView.reloadData()
    }
    
    func testCellForRowMethodReturnsPEFactsCell(){
        vcMock.viewModel.factDetails = [FactRows(title: "test", description: "PEFactsCell", imageName: "")]
        let cell = vcMock.tableView(vcMock.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is PEFactsCell)
    }
    
    func testNumberOfRowsInSectionReturnsCorrectValues(){
        let value =  vcMock.tableView(vcMock.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(value,0)

    }
    func testHeightforRowAtIndexpath(){
        let value =  vcMock.tableView(vcMock.tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotEqual(value, 60)


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

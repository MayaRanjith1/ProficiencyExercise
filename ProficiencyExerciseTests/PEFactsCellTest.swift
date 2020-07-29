//
//  PEFactsCellTest.swift
//  ProficiencyExerciseTests
//
//  Created by Maya Ranjith  on 29/07/20.
//

import XCTest
@testable import ProficiencyExercise

class PEFactsCellTest: XCTestCase {

  var mockCell = PEFactsCell()
    override func setUp() {
        super.setUp()
        let tableview = UITableView()
        tableview.register(PEFactsCell.self, forCellReuseIdentifier:CellIdentifiers.factCell)
        mockCell = tableview.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell) as! PEFactsCell
    }
    
    func testsetupViews(){
        let labels = UILabel()
        mockCell.addSubview(labels)
        
    }
    
    func testsetupCellWithValues(){
        let mockObj:FactRows = FactRows(title: "test", description: "PEFactsCell", imageName: "")
        mockCell.factTitleLabel.text = mockObj.title
        mockCell.factDescLabel.text = mockObj.description
        
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

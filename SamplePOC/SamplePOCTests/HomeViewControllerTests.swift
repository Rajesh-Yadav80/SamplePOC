//
//  HomeViewControllerTests.swift
//  SamplePOCTests
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import XCTest
@testable import SamplePOC

class HomeViewControllerTests: XCTestCase {

    var homeViewController : HomeViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.homeViewController = HomeViewController()
        self.homeViewController.presenter.numberOfRows = 5
        self.homeViewController.loadView()
        self.homeViewController.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testHASATableView() {
        XCTAssertNotNil(self.homeViewController.tblViewHomeListing)
    }

    func testTableViewHasDelegate() {
        XCTAssertNotNil(self.homeViewController.tblViewHomeListing.delegate)
    }
    
    func testTableViewHasDatasource() {
        XCTAssertNotNil(self.homeViewController.tblViewHomeListing.dataSource)
    }
    
    func testTableViewListing() {
        XCTAssertNotNil(self.homeViewController.tblViewHomeListing.reloadData())
    }
    
    func testTableViewConformsToTheDatasourceProtocol() {
                XCTAssertTrue(self.homeViewController.conforms(to: UITableViewDataSource.self))
        
        XCTAssertTrue(self.homeViewController.responds(to: #selector(self.homeViewController.numberOfSections(in:))))
        
        
        XCTAssertTrue(self.homeViewController.responds(to: #selector(self.homeViewController.tableView(_:numberOfRowsInSection:))))
        
        XCTAssertTrue(self.homeViewController.responds(to: #selector(self.homeViewController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = self.homeViewController.tableView(self.homeViewController.tblViewHomeListing, cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeListingTblViewCell
        
        let existReuseId = cell?.reuseIdentifier
        let expectedIdentifier = "HomeListingTblViewCell"
        
        XCTAssertEqual(existReuseId, expectedIdentifier)
        
    }
    
    func testAPICalling(){
           
           let expectation = self.expectation(description: "simple expectation")
           
           let url = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
           
           var result : NSDictionary?
           
           APIManager.request(url: url, showLoader: false) { (status, response, message) in
               result = response
               expectation.fulfill()
               XCTAssert(status == true, "status is not matching the server data")
           }

           self.waitForExpectations(timeout: 5) { (error) in
               XCTAssertNotNil(result)
           }
       }
}

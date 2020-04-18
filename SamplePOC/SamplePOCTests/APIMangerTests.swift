//
//  APIMangerTests.swift
//  APIMangerTests
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import XCTest
@testable import SamplePOC

class APIMangerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
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
    
    func testAPICalling(){
        
        let expectation = self.expectation(description: "simple expectation")
        
        let url = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
        
        var result : NSDictionary?
        
        APIManager.request(url: url, showLoader: false) { (status, response, message) in
            result = response
            print(response)
            expectation.fulfill()
            XCTAssert(status == true, "status is not matching the server data")
        }

        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(result)
        }
    }

}

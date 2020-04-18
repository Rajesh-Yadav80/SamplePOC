//
//  HttpClientTests.swift
//  SamplePOCTests
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import XCTest
@testable import SamplePOC

class HttpClientTests: XCTestCase {
    
    static internal let session = HttpURLSession()
    var httpClient = HttpClient(session: session)
    
    let testUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

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
    
    func test_get_request_with_URL() {

        guard let url = URL(string: testUrl) else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(HttpClientTests.session.lastURL == url)
        
    }
    
    func test_get_resume_called() {
        
        let dataTask = HttpURLSessionDataTask()
        HttpClientTests.session.nextDataTask = dataTask
        
        guard let url = URL(string: testUrl) else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
            print("Success")
            print(success as Any)
            print("Response")
            print(response as Any)
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        HttpClientTests.session.nextData = expectedData
        
        var actualData: Data?
        httpClient.get(url: URL(string: testUrl)!) { (data, error) in
            actualData = data
            
            print("Data")
            print(data?.base64EncodedString() as Any)
            
            print("Error")
            print(error as Any)
        }
        
        XCTAssertNotNil(actualData)
    }

}

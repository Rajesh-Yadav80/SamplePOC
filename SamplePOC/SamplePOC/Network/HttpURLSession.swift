//
//  HttpURLSession.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

/**
*  HttpURLSession is inherit from URLSessionProtocol.
*
*  Used To Provide Or Access Common Feature
*
*  @Developed By: Rajesh Yadav
*/
//MARK: HttpURLSession
class HttpURLSession: URLSessionProtocol {

    var nextDataTask = HttpURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?
    
    private (set) var lastURL: URL?
    
    /**
    *  SuccessHttpUrlResponse method for HTTPURLResponse
    *
    *  @param: @request
    *
    *  @return: @URLResponse.
    *
    *  @Developed By: Rajesh Yadav
    */
    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
    
    /**
    *  dataTask method for completing URLSessionDataTask
    *
    *  @param: @request, @callback
    *
    *  @return: @URLSessionDataTaskProtocol.
    *
    *  @Developed By: Rajesh Yadav
    */
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return nextDataTask
    }
}

class HttpURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    /**
    *  resume method for resuming URLSessionDataTask
    *
    *  @param: empty
    *
    *  @return: empty
    *
    *  @Developed By: Rajesh Yadav
    */
    func resume() {
        resumeWasCalled = true
    }
}

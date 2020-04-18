//
//  HttpClient.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import UIKit

// Protocol for MOCK/Real
protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}



/**
*  HttpClient for calling web api with get method.
*
*  Used To Provide Or Access Common Feature
*
*  @Developed By: Rajesh Yadav
*/
//MARK: HttpClient Implementation
class HttpClient {
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
        
    }
    
    /**
    *  Get method for Web api request
    *
    *  @param: @url, @callback.
    *
    *  @return empty.
    *
    *  @Developed By: Rajesh Yadav
    */
    func get( url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }

}

//MARK: Conform the protocol
extension URLSession: URLSessionProtocol {
    
    /**
    *  DataTask method for returning URLSessionDataTask protocol object
    *
    *  @param: @request, @callback.
    *
    *  @return URLSessionDataTaskProtocol.
    *
    *  @Developed By: Rajesh Yadav
    */
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}



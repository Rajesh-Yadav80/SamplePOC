//
//  HomeService.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

class HomeService {
//
//    static func getListingData(callBack:@escaping(_ status: Bool, _ response: ResponseHomeListing?, _ message: String?) -> Void) {
//        // GET
//        // Convert Model request object into JSONString
//        let apiUrl = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
//
//
//        let session = HttpURLSession()
//        let httpClient = HttpClient(session: session)
//
//        let dataTask = HttpURLSessionDataTask()
//        session.nextDataTask = dataTask
//
//        guard let url = apiUrl else {
//            fatalError("URL can't be empty")
//        }
//
//        httpClient.get(url: url) { (success, response) in
//            // Return data
//            print("Success")
//            print(success as Any)
//            print("Response")
//            print(response as Any)
//        }
//
//        // API Calling with URLRequest
////        APIManager.request(urlRequest: reqGet, showLoader: true) { (status, response, error, errorCode) in
////            // Check API Response Status
////            if status == true{ // Success
////                if let responseDict = response {
////                    let res:ResponseHomeListing? = ResponseHomeListing().getModelObjectFromServerResponse(jsonResponse: responseDict)
////                    callBack(status, res, res?.message, errorCode)
////                }
////            } else { // Failed
////                callBack(status, nil, error, errorCode)
////            }
////        }
//    }
    
    /**
     *  HomeController ViewModel API
     *
     *  @Developed By: Rajesh Yadav
     */
    static func getListingData(callBack:@escaping(_ status: Bool, _ response: ResponseHomeListing?, _ message: String?) -> Void){
        
        let url = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
        
        APIManager.request(url: url, showLoader: false) { (status, response, message) in
            if status {
                if let responseDict = response {
                    let res:ResponseHomeListing? = ResponseHomeListing().getModelObjectFromServerResponse(jsonResponse: responseDict)
                    
                    callBack(status, res, message)
                }
            }else {
                // Failed
                callBack(status, nil, message)
            }
        }
    }
}

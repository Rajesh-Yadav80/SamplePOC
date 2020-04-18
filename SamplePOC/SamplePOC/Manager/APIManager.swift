//
//  APIManager.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation


/**
 *  APIManager Class Used To Connect With Backend Services.
 *
 *  @Developed By: Sandeep Mahajan
 */
class APIManager {
    
   
    static func request(url:URL?, showLoader:Bool?,callback:@escaping (Bool, NSDictionary?, String?) -> Void) {
        if AppManager.shared.isNetworkAvailable() {
            
                let session = URLSession.shared
                
                //TODO: update session default timeout of API
                let sessionConfig = URLSessionConfiguration.default
                sessionConfig.timeoutIntervalForRequest = 100.0
                sessionConfig.timeoutIntervalForResource = 190.0
                
                
                session.dataTask(with: url!) {data, response, error in
                    
                    if error != nil {
                        print(error!.localizedDescription)
                        // Parse error
                        let responseError = error! as NSError

                        callback(false, nil, responseError.localizedDescription)
                    } else {
                        if let value = String(data: data!, encoding: .ascii) {
                            if let jsonData = value.data(using: .utf8) {
                                do {
                                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! NSDictionary
                                    
                                    callback(true,json,nil)
                                } catch {
                                    NSLog("ERROR \(error.localizedDescription)")
                                    callback(false,nil,error.localizedDescription)
                                }
                            }
                        }
                    }
                    
                    }.resume()
            
        }else {
            debugPrint("Please check your internet connection.")
            AppManager.shared.showAlertNativeDialog("No Internet Connection.", message: "Please check your internet connection.") { (title) in
                debugPrint(title)
            }
            
        }
        
    }
    
}




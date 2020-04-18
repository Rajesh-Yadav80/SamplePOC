//
//  AppConstant.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

/**
 *  AppConstant Class
 *
 *  Declare All The Constant Here
 *
 *  @Developed By: Rajesh Yadav
 */
class AppConstant {
    internal static let PullToReferesh = "Pull to refresh"
}

/**
 *  NavigationConstant Struct
 *
 *  Declare All The NavigationConstant Here
 *
 *  @Developed By: Rajesh Yadav
 */
struct NavigationConstant {
    static let titleHome = "Home"
}

/**
 *  BASEURLs Struct
 *
 *  Change Your Server From Here
 *
 *  @Developed By: Rajesh Yadav
 */
struct BASEURLs {
    static let development = "https://dl.dropboxusercontent.com/s/"
    static let production = "https://dl.dropboxusercontent.com/s/"
    
    static let baseURL = development
}

/**
 *  APIKeys Struct
 *
 *  All The API End Point will be declared here
 *
 *  @Developed By: Rajesh Yadav
 */
struct APIKeys {
    internal static let API_JSON_DATA  = "2iodh4vg0eortkl/facts.json"
}

/**
 *  API Response Struct
 *
 *  All The API End Point will be declared here
 *
 *  @Developed By: Rajesh Yadav
 */
struct ErrorConstant {
    internal static let APIResponseErro = "Something went wrong."
}


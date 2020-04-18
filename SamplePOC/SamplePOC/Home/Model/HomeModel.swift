//
//  HomeModel.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 *  Response Class For Parsing Json.
 *
 *  @Developed By: Rajesh Yadav
 */
class ResponseHomeListing : Mappable {
    
    var title : String?
    var rows : [Rows]?
   
    
    required init(){
        
    }
    
    // Convert Json response to class object
    func getModelObjectFromServerResponse(jsonResponse: AnyObject)->ResponseHomeListing?{
        var apiResponse:ResponseHomeListing?
        if jsonResponse is NSDictionary{
            let resDict:NSDictionary? = (jsonResponse as! NSDictionary)
            if resDict != nil{
                let mapper = Mapper<ResponseHomeListing>()
                if let modelObject = mapper.map(JSON: resDict as! [String : Any]){
                    apiResponse = modelObject
                }
            }
        }else if jsonResponse is String{
            let resJSONString = jsonResponse as? String
            let data = resJSONString?.data(using: String.Encoding.utf8)!
            
            if (resJSONString?.isEmpty)! { // On Success response is empty
                apiResponse = ResponseHomeListing()
            }
            
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    let mapper = Mapper<ResponseHomeListing>()
                    if let modelObject = mapper.map(JSON: jsonResult as! [String : Any]){
                        apiResponse = modelObject
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return apiResponse ?? nil
    }
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        title      <- map["title"]
        rows     <- map["rows"]
    }
    
    /**
     *  Inner Response Class For Parsing Rows Json.
     *
     *  @Developed By: Rajesh Yadav
     */
    class Rows: Mappable {
        
        var title : String?
        var description:String?
        var imageHref:String?
        
        required init(){
            
        }
        
        // Convert Json response to class object
        func getModelObjectFromServerResponse(jsonResponse: AnyObject)->Rows?{
            var apiResponse:Rows?
            if jsonResponse is NSDictionary{
                let resDict:NSDictionary? = (jsonResponse as! NSDictionary)
                if resDict != nil{
                    let mapper = Mapper<Rows>()
                    if let modelObject = mapper.map(JSON: resDict as! [String : Any]){
                        apiResponse = modelObject
                    }
                }
            }else if jsonResponse is String{
                let resJSONString = jsonResponse as? String
                let data = resJSONString?.data(using: String.Encoding.utf8)!
                
                if (resJSONString?.isEmpty)! { // On Success response is empty
                    apiResponse = Rows()
                }
                
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                        let mapper = Mapper<Rows>()
                        if let modelObject = mapper.map(JSON: jsonResult as! [String : Any]){
                            apiResponse = modelObject
                        }
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            return apiResponse ?? nil
        }
        
        required init?(map: Map){
        }
        
         func mapping(map: Map){
            title           <- map["title"]
            description     <- map["description"]
            imageHref       <- map["imageHref"]
            
        }
    }
}

//
//  HomePresenter.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

class HomePresenter {
    var view:HomeViewController!
    
    // TableView numberOfSection
    var numberOfSection = 1
    
    // TableView numberOfRows
    var numberOfRows = 0
    
    // api response holder
    var resHomeListing : ResponseHomeListing?
    
    func attachView(view: HomeViewController) {
        self.view = view
        
    }
    
}

extension HomePresenter {
    
    func getListingData(callBack:@escaping(_ status: Bool) -> Void){
        
        //  status: Bool, _ response: ResponseHomeListing?, _ message: String?
        
        HomeService.getListingData(callBack: {
            (status, response, message) in
            if (status == true) {
                OperationQueue.main.addOperation {
                    
                    if(response != nil ){
                        self.resHomeListing = response
                        
                        if(response?.rows != nil && (response?.rows?.count)! > 0){
                            self.numberOfRows = response?.rows?.count ?? 0
                        }
                    }
                    callBack(status)
                }
            } else {
                OperationQueue.main.addOperation {
                    callBack(status)
                }
            }
        })
    }
}

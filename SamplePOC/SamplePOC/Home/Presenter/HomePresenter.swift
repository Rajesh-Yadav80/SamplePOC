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
                        self.view.resHomeListing = response
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

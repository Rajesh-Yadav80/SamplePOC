//
//  ExtensionImageView.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

/**
 *  Extension Of ImageView Class
 *
 *  @Developed By: Rajesh Yadav
 */
extension UIImageView{
    
    /**
     *  Called by class name only, Used to round imageview
     *
     *  param key : nothing.
     *
     *  return : nothing.
     *
     *  @Developed By: Rajesh Yadav
     */
    func rounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
    }
}

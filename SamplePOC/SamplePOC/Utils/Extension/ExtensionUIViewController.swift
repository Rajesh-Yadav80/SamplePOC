//
//  ExtensionUIViewController.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import Toast_Swift

public extension NSObject{
    /**
     *  Class function, called by class name only
     *
     *  param key : Not required.
     *
     *  return : String.
     *
     *  @Developed By: Rajesh Yadav
     */
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}


extension UIViewController {
    /**
     *  Toast Message,Like Android Toast
     *
     *  param key : Takes one param title.
     *
     *  return : nothing.
     *
     *  @Developed By: Rajesh Yadav
     */
    func makeAndroidToast(_ title: String?){
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .darkGray
        ToastManager.shared.style = style
        self.view.makeToast(title, duration: 2.0, position: .bottom, style: style)
    }
}

//
//  ExtensionImageView.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import UIKit

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
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layoutIfNeeded()
    }
}

class ImageLayerSetup: UIImageView{
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0{
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var masksToBounds: Bool = false{
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable var clipToBounds: Bool = false{
        didSet {
            clipsToBounds = clipToBounds
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero{
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    
    
    // Add new variable
    @IBInspectable var isAllowCircular: Bool = false
    
    override func layoutSubviews() {
        if isAllowCircular {
            super.layoutSubviews()
            let radius: CGFloat = self.bounds.size.height / 2.0
            self.layer.cornerRadius = radius
            self.clipsToBounds = true
        }
    }
}

//
//  ExtensionString.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation

/**
 *  Extension Of String Class
 *
 *  @Developed By: Rajesh Yadav
 */
extension String {
    
    /**
     *  Conver string to URL
     *
     *  param key : nothing.
     *
     *  return : URL.
     *
     *  @Developed By: Rajesh Yadav
     */
    func toUrl()->URL? {
//        return URL(string:self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        let url = URL(string: self.replacingOccurrences(of: " ", with: "%20"))
        return url
    }
    
    /**
     *  Removed space or trim space
     *
     *  param key : nothing.
     *
     *  return : String.
     *
     *  @Developed By: Rajesh Yadav
     */
    func trimmedString() -> String? {
        return (self.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines)))
    }
    
}

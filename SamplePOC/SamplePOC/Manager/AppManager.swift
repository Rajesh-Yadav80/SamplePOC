//
//  AppManager.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import Reachability
import UIKit

/**
 *  AppManager is Shared Class.
 *
 *  Used To Provide Or Access Common Feature
 *
 *  @Developed By: Rajesh Yadav
 */
class AppManager: NSObject {
    
    static let shared = AppManager()
    var reachability: Reachability!
    var isNetworkConnected = false
    
    internal static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override init() {
        reachability = try! Reachability()
    }
}

//MARK:- Method for start and stop network monitoring
//MARK:-
extension AppManager{
    /**
    *  Starts monitoring the network availability status
    *
    *  @param key empty.
    *
    *  @return empty.
    *
    *  @Developed By: Rajesh Yadav
    */
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleNetworkChangeEvent),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability.startNotifier()
            // reconnect socket
            if(reachability.connection == .wifi || reachability.connection == .cellular){
                updateNetworkInfo()
            }
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    /**
    *  Stops monitoring the network availability status
    *
    *  @param key empty.
    *
    *  @return empty.
    *
    *  @Developed By: Rajesh Yadav
    */
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
    }
    
    /**
       *  Called whenever there is a change in NetworkReachibility Status
       *
       *  @param notification: Notification with the Reachability instance.
       *
       *  @return empty.
       *
       *  @Developed By: Rajesh Yadav
       */
       @objc func handleNetworkChangeEvent(_ notification: Foundation.Notification!) -> Void {
           let reachability = notification.object as! Reachability
           switch reachability.connection {
           case .unavailable, .none:
               debugPrint("Network became unreachable")
               isNetworkConnected = false
               DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
//                   self.showNetworkNotAvailableAlertController()
                self.showAlertNativeDialog(title: "Sample POC", message: "Network became unreachable", completion: {
                    message in
                })
               }
           case .wifi:
               debugPrint("Network reachable through WiFi")
               isNetworkConnected = true
               updateNetworkInfo()
           case .cellular:
               debugPrint("Network reachable through Cellular Data")
               isNetworkConnected = true
               updateNetworkInfo()
           }
       }
}

extension AppManager{
    /**
    *  Send internal notification for network connect done by application
    *
    *  @param empty.
    *
    *  @return empty.
    *
    *  @Developed By: Rajesh Yadav
    */
    func updateNetworkInfo(){
//        SwiftEventBus.post(kRefreshDataOnNetworkConnection)
    }
}

//MARK:- Method for checking network and alert
//MARK:-
extension AppManager {
    
    /**
     *  To Check Internet Connection
     *
     *  Param : No parameter required
     *
     *  return : Boolean value return
     *
     *  @Developed By: Rajesh Yadav
     */
     func isNetworkAvailable()-> Bool{
        
        do {
            if try Reachability().connection == Reachability.Connection.unavailable {
                return false
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        debugPrint("Network reachable")
        return true
    }
    
    /**
     *  To Show Alert Message
     *
     *  Param : @title, @message
     *
     *  return : @callback on completion
     *
     *  @Developed By: Rajesh Yadav
     */
    func showAlertNativeDialog(title:String, message:String,completion:@escaping ((String)->Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){ (action) in
            completion("OK")
        }
        
        alert.addAction(okAction)
        AppManager.appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

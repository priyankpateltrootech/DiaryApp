//
//  AppDelegate.swift
//  Unido
//
//  Created by Sagar Chauhan on 16/10/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window          : UIWindow?
    var progressVC      : ProgressVC?
    static let shared   = UIApplication.shared.delegate as! AppDelegate
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Keep all code related to didFinishLaunchingWithOptions in below method
        self.configureApplication()
        
        return true
    }
    
    //--------------------------------------------------

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}


//--------------------------------------------------
// MARK:- Extension - AppDelegate
//--------------------------------------------------

extension AppDelegate {
    
    func configureApplication() {
        
        // Enable IQKeyboardManager
        IQKeyboardManager.shared().isEnabled = true
    }
    
    //--------------------------------------------------
    
    func showProgres(_ show: Bool) {
        
        if self.progressVC != nil {
            self.progressVC?.view.removeFromSuperview()
        }
        
        if show {
            self.progressVC = ProgressVC.viewController()
            AppDelegate.shared.window?.addSubview(self.progressVC!.view)
        }
    }
}

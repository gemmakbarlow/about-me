//
//  AppDelegate.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit
import Fabric
import Answers

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        #if RELEASE
            print("Starting Fabric.")
            Fabric.with([Answers.self])
        #else
             print("[Warning] Fabric not started - non-Release build.")
        #endif
        
        return true
    }
}


//
//  AppDelegate.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

import UIKit

#if DEBUG
    import AlamofireNetworkActivityLogger
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()

        #if DEBUG
            NetworkActivityLogger.shared.startLogging()
            NetworkActivityLogger.shared.level = .debug
        #endif

        return true
    }

}


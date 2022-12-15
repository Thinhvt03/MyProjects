//
//  AppDelegate.swift
//  ClockTabBar
//
//  Created by Hoàng Loan on 12/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let clockViewController = storyboard.instantiateViewController(withIdentifier: "ClockViewController")
        let stopWatchViewController = storyboard.instantiateViewController(withIdentifier: "StopWatchViewController")
                
                let tabBarController = UITabBarController()
                tabBarController.viewControllers = [clockViewController, stopWatchViewController]
                
                window?.rootViewController = tabBarController
                window?.makeKeyAndVisible()
        
        
        return true
    }
}


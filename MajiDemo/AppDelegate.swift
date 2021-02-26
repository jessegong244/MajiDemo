//
//  AppDelegate.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        RealmManager.configureRealm()

        let navi = UINavigationController.init(rootViewController: ViewController.init())
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = navi
        return true
    }
}


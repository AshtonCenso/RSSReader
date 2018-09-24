//
//  AppDelegate.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//         Override point for customization after application launch.

        let feedList = FeedListRouter().prepareModule()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = feedList
        window?.makeKeyAndVisible()

        return true
    }
}

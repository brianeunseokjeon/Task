//
//  AppDelegate.swift
//  baseball2222
//
//  Created by brian은석 on 05/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        vc.view.backgroundColor = .white
        
        
        
        return true
    }

}


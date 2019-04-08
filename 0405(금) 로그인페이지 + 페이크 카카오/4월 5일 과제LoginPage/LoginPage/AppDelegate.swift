//
//  AppDelegate.swift
//  LoginPage
//
//  Created by brian은석 on 05/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)  // 먼저 윈도우 만들어주자.
        window?.backgroundColor = .white                // 윈도우 색깔지정안하면 검정으로 나옴.
        
        let vc = ViewController()
        let naviController = UINavigationController(rootViewController: vc)     // 뭘 루트뷰로 쓸꺼니?
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}


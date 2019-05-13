//
//  AppDelegate.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let categoriVC = UINavigationController(rootViewController: CategoryViewController())
        categoriVC.title = "Domino's"
        
        
        let wishVC = UINavigationController(rootViewController: WishListViewController())
        wishVC.title = "Wish List"
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [categoriVC,wishVC]
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

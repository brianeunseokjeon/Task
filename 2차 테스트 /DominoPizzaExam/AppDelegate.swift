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
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 탭바 위에 뷰컨트롤러 올리기
        let tabBarController = UITabBarController()
        let cateVC = CategoryViewController()
        let wishVC = WishListViewController()
    cateVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        wishVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        // FirstVC 에 네비게이션 적용시키기
        tabBarController.viewControllers = [UINavigationController.init(rootViewController: cateVC), wishVC]
        
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
}
}

//
//  AppDelegate.swift
//  catchoutOnePho
//
//  Created by brian은석 on 09/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
       
        // 스토리보드 이용시..
        let view = UIStoryboard.init(name: "Main", bundle: nil)
        let firstVC = view.instantiateViewController(withIdentifier: "identifier")
        
        let secondVC = SecondViewController()
        
        // 스토리보드 이용시..
        let view3 = UIStoryboard.init(name: "Main", bundle: nil)
        let thirdVC = view3.instantiateViewController(withIdentifier: "id")

        let navi = UINavigationController(rootViewController: thirdVC)
        
        firstVC.tabBarItem = UITabBarItem(title: "1", image: nil, selectedImage: nil)
        secondVC.tabBarItem = UITabBarItem(title: "2", image: nil, selectedImage: nil)
        thirdVC.tabBarItem = UITabBarItem(title: "3", image: nil, selectedImage: nil)
        thirdVC.title = "3"
        
        secondVC.notifi()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstVC,secondVC,navi]
        
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        // 1) 윈도우+루트뷰+makeKeyAndVisible
        // 2) 텝바 컨트롤러 생성 + 뷰컨트롤러 담자. / 텝바아이템은 뷰컨트롤러가 이미가지고 있음.
        // 3) 네비게이션 컨트롤러(루트뷰) 끝
        return true
    }

}


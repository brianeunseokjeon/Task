//
//  TabBarConroller.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [
            createNaviController(viewController: MainViewController(), title: "플레이", imageName: "main"),
            createNaviController(viewController: RankingViewController(), title: "랭킹", imageName: "ranking"),
            createNaviController(viewController: BookMarkViewController(), title: "구독", imageName: "bookmark"),
            createNaviController(viewController: MyInfoViewController(), title: "보관함", imageName: "status")
        ]
    }
    
    private func createNaviController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let naviController = UINavigationController(rootViewController: viewController)
        naviController.tabBarItem.title = title
        naviController.tabBarItem.image = UIImage(named: imageName)
        tabBar.tintColor = #colorLiteral(red: 0.09704425186, green: 0.8662689328, blue: 0.7385164499, alpha: 1)
//        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return naviController
    }


}

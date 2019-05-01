//
//  SliderVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SliderVC: UIViewController {
    let customView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        
    }
    func makeView() {
        
    view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}

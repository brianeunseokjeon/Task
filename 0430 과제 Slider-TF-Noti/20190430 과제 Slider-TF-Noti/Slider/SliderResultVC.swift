//
//  SliderResultVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SliderResultVC: UIViewController {
let noti = NotificationCenter.default
    let back = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        back.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(back)
        noti.addObserver(self, selector: #selector(viewColor(_:)), name: .randomColorNoti, object: nil)
    }
    @objc func viewColor(_ sender: Notification) {
        let color = sender.object as! UIColor
        
        back.backgroundColor = color
    }

 

}

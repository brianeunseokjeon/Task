//
//  TextFieldResultVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class TextFieldResultVC: UIViewController {
let noti = NotificationCenter.default
    let label = UILabel(frame: CGRect(x: 30, y: 100, width: 300, height: 80))
    override func viewDidLoad() {
        super.viewDidLoad()
        noti.addObserver(self, selector: #selector(text), name: .text, object: nil)
        label.backgroundColor = .gray
        view.addSubview(label)
    }
    @objc func text(_ sender: Notification) {
        let text = sender.object as! String
        label.text = text
    }
    
}

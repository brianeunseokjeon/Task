//
//  SecondViewController.swift
//  catchoutOnePho
//
//  Created by brian은석 on 09/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let noti = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
       notifi()
    }
    func notifi(){
         noti.addObserver(self, selector: #selector(changeBackgroundColor), name: NSNotification.Name(rawValue: "color"), object: nil)
    }
    
    @objc func changeBackgroundColor(_ sender:Notification){
       let color = sender.object as! UIColor
        view.backgroundColor = color
    }
}

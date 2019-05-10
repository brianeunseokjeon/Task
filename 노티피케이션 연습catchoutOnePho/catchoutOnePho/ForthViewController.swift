//
//  ForthViewController.swift
//  catchoutOnePho
//
//  Created by brian은석 on 09/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let noti = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
        observer()
    }
    
    func observer(){
        noti.addObserver(self, selector: #selector(text(_:)), name: NSNotification.Name("text"), object: nil)
    }
    @objc func text(_ sender:Notification) {
       let string = sender.object as? String
        label.text = string
    }

}

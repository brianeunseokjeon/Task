//
//  SecondViewController.swift
//  0404homework1-3
//
//  Created by brian은석 on 04/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = Singleton.standard.text
    }
    

}

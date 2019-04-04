//
//  ViewController.swift
//  0404homework1-3
//
//  Created by brian은석 on 04/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textAction(_ sender: Any) {
        Singleton.standard.text = textField.text
    }
    
    

}


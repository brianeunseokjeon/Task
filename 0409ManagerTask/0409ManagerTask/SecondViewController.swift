//
//  SecondViewController.swift
//  0409ManagerTask
//
//  Created by brian은석 on 09/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 25
        button2.layer.cornerRadius = 25
    }
    @IBAction func yellowButton(_ sender: Any) {
        guard let firstVC = presentingViewController as? ViewController else { return }
        firstVC.view.backgroundColor = .yellow

    }

    @IBAction func whiteButton(_ sender: Any) {
        guard let firstVC = presentingViewController as? ViewController else { return }
        firstVC.view.backgroundColor = .white

    }

    @IBAction func dismissButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }


    
    
    
    
}

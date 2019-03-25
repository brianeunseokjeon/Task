//
//  ViewController.swift
//  task0322
//
//  Created by brian은석 on 22/03/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var switch2: UISwitch!
    
    @IBOutlet weak var segname: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func switching(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "on"
        } else {
            label.text = "off"
        }
    }
    @IBAction func segChange(_ sender: UISegmentedControl) {
        if switch2.isOn {
        label.text = segname.titleForSegment(at: segname.selectedSegmentIndex) ?? ""
        } else {
            label.text = "off"
        }
    }
}





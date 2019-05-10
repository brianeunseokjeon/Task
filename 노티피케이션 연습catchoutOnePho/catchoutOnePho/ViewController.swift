//
//  ViewController.swift
//  catchoutOnePho
//
//  Created by brian은석 on 09/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color: UIColor? = nil
    let noti = NotificationCenter.default
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alpaSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        let r = redSlider.value
        let b = blueSlider.value
        let g = greenSlider.value
        let alpa = alpaSlider.value
        
        color = UIColor(displayP3Red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpa))
        
        noti.post(name: NSNotification.Name("color"), object: color)

    }

}


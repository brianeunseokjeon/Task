//
//  SecondViewController.swift
//  0404homework1-2
//
//  Created by brian은석 on 04/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var secondLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondLabel.text = UserDefaults.standard.string(forKey: "text")
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

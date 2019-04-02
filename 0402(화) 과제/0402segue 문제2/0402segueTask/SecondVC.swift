//
//  SecondVC.swift
//  0402segueTask
//
//  Created by brian은석 on 02/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    var imageAnimal: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = imageAnimal {
            ImageView.image = image
        }
        // Do any additional setup after loading the view.
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

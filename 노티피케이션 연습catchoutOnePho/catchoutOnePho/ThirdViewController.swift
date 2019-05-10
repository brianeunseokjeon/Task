//
//  ThirdViewController.swift
//  catchoutOnePho
//
//  Created by brian은석 on 09/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    let noti = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    



}

extension ThirdViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       
        
        let view4 = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = view4.instantiateViewController(withIdentifier: "id4")
//        let vc = ForthViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        vc.view.backgroundColor = .white
        vc.viewDidLoad()
         noti.post(name: NSNotification.Name(rawValue: "text"), object: textField.text)
        return true
    }
}

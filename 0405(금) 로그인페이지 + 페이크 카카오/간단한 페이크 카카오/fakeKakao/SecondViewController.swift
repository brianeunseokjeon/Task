
//
//  SecondViewController.swift
//  fakeKakao
//
//  Created by brian은석 on 08/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        }
    
    @IBAction func button(_ sender: Any) {
        let alert = UIAlertController(title:"성공",
                                      message: "\(String(describing: textField.text)) 가 추가되었습니다.", preferredStyle: .alert)
        
        let alert2 = UIAlertController(title: "ERROR", message: "실패했습니다.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) {  _ in
            Friends.friend.save.append(self.textField.text!)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert2.addAction(cancel)
        
        if textField.text != "" {
            present(alert, animated: true)
        } else {
            present(alert2, animated: true)
        }
    }
    

}

//
//  SecondViewController.swift
//  LoginPage
//
//  Created by brian은석 on 05/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var saveText : String? 
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        label.text = saveText
    }
    
    func makeView(){
        label.frame = CGRect(x: 60, y: 100, width: view.frame.width - 120, height: 80)
        label.backgroundColor = .yellow
        view.addSubview(label)
        
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 300 , width: view.frame.width - 60, height: 80)
        button.setTitle("sign out", for: .normal)
        button.addTarget(self, action: #selector(dismiss1), for: .touchUpInside)
        button.backgroundColor = .blue
        view.addSubview(button)
    }
    
    @objc func dismiss1(){
        presentingViewController?.dismiss(animated: true)
        dismiss(animated: true)
    }
    
    
    
    

}

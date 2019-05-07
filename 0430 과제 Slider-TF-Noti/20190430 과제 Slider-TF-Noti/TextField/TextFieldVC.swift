//
//  TextFieldVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
extension Notification.Name {
    static let text = Notification.Name("text")
}


class TextFieldVC: UIViewController {
    let textField = UITextField(frame: CGRect(x: 30, y: 100, width: 300, height: 80))
    let noti = NotificationCenter.default
    let button = UIButton(frame: CGRect(x: 80, y: 250, width: 200, height: 100))
    let vc = TextFieldResultVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeView()
        vc.observer11111()
    }
    func makeView() {
        textField.backgroundColor = .gray
        textField.addTarget(self, action: #selector(text1), for: .editingChanged)
        view.addSubview(textField)
        
        button.backgroundColor = .yellow
        view.addSubview(button)
        button.addTarget(self, action: #selector(next1), for: .touchUpInside)
    }
   
//    {
//
//    }
    @objc func text1() {
        noti.post(name: .text, object: textField.text)
    }
    @objc func next1() {
       
        present(vc, animated: true)
        
        vc.view.backgroundColor = .white
    }
}

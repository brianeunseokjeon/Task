//
//  ViewController.swift
//  0326TextField
//
//  Created by brian은석 on 26/03/2019.
//  Copyright © 2019 brian. All rights reserved.
////[ 과제 ]
//1. 영상 참고
//    > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//        > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()

    }
    func makeView() {
       
        label.frame = CGRect(x: 80, y: 90, width: 240, height: 120)
        label.backgroundColor = .yellow
        label.textColor = .blue
        view.addSubview(label)
        
        
        textField.frame = CGRect(x: 140, y: 300, width: 120, height: 80)
        textField.backgroundColor = .green
        textField.addTarget(self, action: #selector(textFunction), for: .editingChanged)
        textField.addTarget(self, action: #selector(textFunction2), for: .editingDidEndOnExit)
        view.addSubview(textField)

    }
    
    @objc func textFunction(){
        label.text = textField.text
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .blue
        
    }
    @objc func textFunction2(){
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
    }
}


//
//  CustomView.swift
//  ImagePickerControllerExample
//
//  Created by brian은석 on 08/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomView: UIView {
    let textField = UITextField()
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeView()
        
    }
    func makeView() {
        let arr = [label, textField]
        for x in arr {
            x.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(x)
        }
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        label.backgroundColor = .gray
        
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textField.backgroundColor = .gray
        textField.placeholder = "숫자만 입력"
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  CustomView.swift
//  Instagram
//
//  Created by brian은석 on 17/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CustomView: UIView {
    let textField = UITextField()
//    let addBtn = UIButton()
    var buttons :[UIButton] = []

    
    
    var emojis = ["😁","😂","👾","😡","😍","❤️","🙌🏿","🐈"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButton()
        makeView()
        
    }
    func makeButton() {

        for x in emojis {
            let button = UIButton()
            
            button.setTitle("\(x)", for: .normal)
            button.addTarget(self, action: #selector(emojiBtn(_:)), for: .touchUpInside)
            
            self.addSubview(button)
            buttons.append(button)
            
        }
        
        for y in 0...buttons.count - 1 {
            buttons[y].translatesAutoresizingMaskIntoConstraints = false
            
            buttons[y].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            buttons[y].widthAnchor.constraint(equalToConstant: 51.5).isActive = true
            buttons[y].heightAnchor.constraint(equalToConstant:51.5).isActive = true
            
            if y == 0 {
                buttons[0].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            } else if y == buttons.count - 1 {
                buttons[y].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            } else {
                buttons[y].leadingAnchor.constraint(equalTo: buttons[y-1].trailingAnchor).isActive = true
            }
        }
    }
    func makeView() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.placeholder = "댓글달기..."
        textField.borderStyle = .roundedRect

    }
    
    @objc func emojiBtn(_ sender:UIButton) {
        
        textField.text = textField.text! + "\(sender.currentTitle!)"
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

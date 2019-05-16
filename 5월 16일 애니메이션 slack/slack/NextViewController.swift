//
//  NextViewController.swift
//  slack
//
//  Created by brian은석 on 16/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    private var labelLeadingConst: NSLayoutConstraint!
    
    let textField :UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        return textField
    }()
    let label :UILabel = {
        let label = UILabel()
        label.text = ".slack.com"
        label.alpha = 0.7
        return label
    }()
    
    let view1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.becomeFirstResponder()
        textField.delegate = self
        // 순서가 중요. addsubview 먼저하고 레이아웃 잡아야 오류안생김;;
        addsub()
        makeView()

    }
    func addsub() {
        view.addSubview(view1)
        let arr = [textField,label]
        for x in arr {
        view1.addSubview(x)
         
        }
    }
    func makeView() {
        
        view1.layout
            .leading(constant: 10)
            .trailing(constant: -10).centerY(constant: -115)
        view1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textField.layout
            .leading(constant: 6)
            .trailing(constant: -6).centerY(constant: 0)
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.addTarget(self, action: #selector(pointSlack), for: .editingChanged)
        
        label.layout
            .trailing(constant: -6).centerY(constant: 0)
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelLeadingConst = label.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        labelLeadingConst.isActive = true
        
//        let defaultCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor)
//        defaultCenterYConst.priority = UILayoutPriority(500)
//        defaultCenterYConst.isActive = true
        
        
        
        
        
    
    }
    @objc func pointSlack(){
        guard let text = textField.text else { return }
        
        let textSize = (text as NSString).size(withAttributes: [.font: textField.font!])
        labelLeadingConst.constant = textSize.width + 16
    }
}

extension NextViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "error" {
//            UIView.animateKeyframes(
//                withDuration: 0.5 ,
//                delay: 0,
//                options: [],
//                animations: {
//                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
//                        <#code#>
//                    })
//            })
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        return true
    }
}

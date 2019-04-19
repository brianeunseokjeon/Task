//
//  ViewController.swift
//  calculator
//
//  Created by brian은석 on 19/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textFieldOperator: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button(_ sender: UIButton) {
        guard (Double(textField1.text ?? "0.0") != nil) && (Double(textField2.text ?? "0.0") != nil) else {
            alert(title: "오류입니다. 피연산자에 숫자입력부탁", message: "")

            return
        }
        let num1 = Double(textField1.text ?? "0")
        let num2 = Double(textField2.text ?? "0")
        
        switch textFieldOperator.text {
        case "+":
            let num3 = num1! + num2!
            alert(title: "\(num1!) + \(num2!) = \(num3)", message: "")
        case "-":
            let num3 = num1! - num2!
            alert(title: "\(num1!) - \(num2!) = \(num3)", message: "")
        case "*":
            let num3 = num1! * num2!
            alert(title: "\(num1!) * \(num2!) = \(num3)", message: "")
        case "/":
            let num3 = (num1! / num2!)
            alert(title: "\(num1!) / \(num2!) = \(num3)", message: "")
        default:
            alert(title: "+ , - , * , / 만 입력해주세요", message: "")
        }
        
    }
    func alert(title:String, message: String) {
        let alertController = UIAlertController(
            title: title , message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    
    

}


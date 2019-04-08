//
//  ThirdViewController.swift
//  LoginPage
//
//  Created by brian은석 on 07/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let nameTextField = UITextField()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        makeView()
    }
    
    func makeView(){

        
        nameTextField.frame = CGRect(x: 80, y: 200, width: view.frame.width - 160, height: 80)
        nameTextField.borderStyle = .line
        nameTextField.autocapitalizationType = .none        // 첫글자 대문자 방지.
        nameTextField.resignFirstResponder()
        view.addSubview(nameTextField)
        
        
        passwordTextField.frame = CGRect(x: 80, y: 350, width: view.frame.width - 160, height: 80)
        passwordTextField.borderStyle = .line
        passwordTextField.autocapitalizationType = .none     // 첫글자 대문자 방지.
        passwordTextField.resignFirstResponder()
        view.addSubview(passwordTextField)
    
        let button = UIButton()
        button.frame = CGRect(x: 60, y: 500, width: view.frame.width - 120, height: 60)
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @objc func signIn() {
        
        
        let alertController = UIAlertController(
            title: "아이디와 비밀번호", message: "아이디 : \(nameTextField.text ?? "")  비밀번호: \(passwordTextField.text ?? "")" , preferredStyle: .alert)
        
        let alertCon2 = UIAlertController(title: "아이디 4글자 이상, 비밀번호 4글자이상 가능", message:
            "", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "확인", style: .default) {
            _ in if self.nameTextField.text != nil && self.passwordTextField.text != nil {
                if self.nameTextField.text!.count >= 4 && self.passwordTextField.text!.count >= 4 && self.nameTextField.text!.count <= 16 && self.passwordTextField.text!.count <= 16  {
                Save.shared.tfEmail[self.passwordTextField.text ?? ""] = self.nameTextField.text ?? ""
                } else {
                    self.present(alertCon2, animated: true)
                }
            }
            self.nameTextField.text = ""
            self.passwordTextField.text = ""
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)            //이거 안써주면 어럿컨트롤러 실행안돰.
        
        alertCon2.addAction(cancelAction)
    }
}

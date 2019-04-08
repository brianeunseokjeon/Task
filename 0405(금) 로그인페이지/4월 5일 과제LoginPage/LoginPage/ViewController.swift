//
//  ViewController.swift
//  LoginPage
//
//  Created by brian은석 on 05/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let textFieldEmail = UITextField()
    let textFieldPassword = UITextField()
    let containView = UIView()
    var shared = Save.shared        // 밑에처럼 바로 가져오면 첫번째 프로퍼티만 저장함. 그래서 쉐어드에 저장된 프로퍼티사용하려면 이렇게 사용하면 될듯!~!
    //    let email = Save.shared.tfEmail.values   >>> 이렇게하면 안됨. 왜안될까요?
//    let password = Save.shared.tfEmail.keys       >>> email 대신에 Save.shared.tfEmail.values 넣으면됨
    var tfEmail = ""
  
    let secondVC = SecondViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        
        navigationItem.title = "Login Page"
        
        if #available(iOS 11.0, *) { // 버전 얘기할 때, ios 11 이상.
            navigationController?.navigationBar.prefersLargeTitles = true         // 타이틀을 크게만드는 코드.
        }
        let barButton = UIBarButtonItem(
            title: "회원가입",
            style: .done, target: self, action: #selector(pushViewController(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(Save.shared.tfEmail.values, Save.shared.tfEmail.keys)
    }
   
    @objc private func pushViewController(_ sender: Any){
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }               // 네비게이션 컨트롤러로 푸쉬한후 팝?하는 방법?
    
    
    
    func makeView(){
        UIView.animate(withDuration: 0.2) {
            self.view1.frame.origin.y += 80
            self.view2.frame.origin.y += 65
            self.view3.frame.origin.y += 50
        }
        
        // view
        view1.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        view1.backgroundColor = .red
        view.addSubview(view1)
        
        view2.frame = CGRect(x: 180, y: 200, width: 50, height: 50)
        view2.backgroundColor = .red
        view.addSubview(view2)
        
        view3.frame = CGRect(x: 260, y: 200, width: 50, height: 50)
        view3.backgroundColor = .red
        view.addSubview(view3)
        
        containView.frame = CGRect(x: 5, y: 400, width: view.frame.width - 10, height: 500)
        view.addSubview(containView)
        
        
        //text Field 이메일
        textFieldEmail.frame = CGRect(x: 115, y: 100, width: containView.frame.width - 200, height: 80)
        textFieldEmail.placeholder = "이메일을 입력하세요."
        textFieldEmail.addTarget(self, action: #selector(no), for: .editingChanged)
        containView.addSubview(textFieldEmail)
        textFieldEmail.autocapitalizationType = .none                 // 첫글자 대문자 나오는것 제거하는 방법.
        
        let imageEmail = UIImageView()
        imageEmail.frame = CGRect(x: 15, y: 100, width: 40 , height: 40)
        imageEmail.image = UIImage(named: "email")
        containView.addSubview(imageEmail)
        
        // text Field 비밀번호
        textFieldPassword.frame = CGRect(x: 115, y: 200, width: containView.frame.width - 200, height: 80)
        textFieldPassword.placeholder = "비밀번호 입력하세요."
        textFieldPassword.isSecureTextEntry = true
        containView.addSubview(textFieldPassword)
        
        let imagePassWord = UIImageView()
        imagePassWord.frame = CGRect(x: 15, y: 200, width: 40 , height: 40)
        imagePassWord.image = UIImage(named: "password")
        containView.addSubview(imagePassWord)
        
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 280, width: containView.frame.width - 30, height: 40)
        button.setTitle("sign In", for: .normal)
        button.addTarget(self, action: #selector(move), for: .touchUpInside)
        button.backgroundColor = .blue
        containView.addSubview(button)
        
  
    }
    @objc func no(){
       let alert = UIAlertController(title: "아이디 4글자 이상, 비번 4글자이상 가능", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        guard (textFieldEmail.text ?? "").count >= 4 && (textFieldPassword.text ?? "").count <= 16 else {
            present(alert, animated: true)
            return
        }
    }
    
    
    @objc func move(){
      
            if Save.shared.tfEmail.values.contains(textFieldEmail.text ?? "") == true && Save.shared.tfEmail.keys.contains(textFieldPassword.text ?? "") == true {
                secondVC.saveText = textFieldEmail.text
                present(secondVC,animated: true)
            } else if Save.shared.tfEmail.values.contains(textFieldEmail.text ?? "") == true && Save.shared.tfEmail.keys.contains(textFieldPassword.text ?? "") == false {
                UIView.animate(withDuration: 2){
                    self.textFieldPassword.backgroundColor = UIColor.red
                }
            } else if Save.shared.tfEmail.values.contains(textFieldEmail.text ?? "") == false && Save.shared.tfEmail.keys.contains(textFieldPassword.text ?? "") == true {
                UIView.animate(withDuration: 2) {
                    self.textFieldEmail.backgroundColor = UIColor.red
                }
            } else if Save.shared.tfEmail.values.contains(textFieldEmail.text ?? "") == false && Save.shared.tfEmail.keys.contains(textFieldPassword.text ?? "") == false {
                UIView.animate(withDuration: 2) {
                    self.textFieldEmail.backgroundColor = UIColor.red
                    self.textFieldPassword.backgroundColor = UIColor.red
                }
            }
            if textFieldEmail.backgroundColor == .red {
                UIView.animate(withDuration: 0.5){
                    self.textFieldEmail.backgroundColor = UIColor.white
                }
            }
            if textFieldPassword.backgroundColor == .red {
                UIView.animate(withDuration: 0.5){
                    self.textFieldPassword.backgroundColor = UIColor.white
                }
            }
        print(Save.shared.tfEmail.values , Save.shared.tfEmail.keys)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        UIView.animate(withDuration: 0.2) {
            self.containView.frame.origin.y += 180
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if containView.frame.origin.y != CGFloat(220) {
            UIView.animate(withDuration: 0.2) {
                self.containView.frame.origin.y -= 180
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! + string.count > 20 {
            return false
        } else {
            return true
        }
    }
    
    
}

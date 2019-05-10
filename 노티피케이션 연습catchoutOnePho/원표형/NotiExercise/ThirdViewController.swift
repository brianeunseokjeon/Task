//
//  ThirdViewController.swift
//  NotiExercise
//
//  Created by HongWeonpyo on 04/05/2019.
//  Copyright © 2019 ShoppingBook. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

  let textField : UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    configurate()
    addSubview()
    autoLayout()
    textField.delegate = self
  }
  
  
  func configurate() {
    textField.borderStyle = .roundedRect
    textField.placeholder = "내용을 입력해 주세요."
  }
  
  func addSubview() {
    view.addSubview(textField)
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 20
    
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 5),
      textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      textField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin)
      
      ])
  }
}


extension ThirdViewController: UITextFieldDelegate {
    
    
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    let text = textField.text ?? ""

    let fourthVC = FourthViewController()
    fourthVC.title = "Fourth"
    fourthVC.noti()
    
    NotificationCenter.default.post(name: Notification.Name("ThirdViewText"), object: nil, userInfo: ["text": text])
    

    navigationController?.pushViewController(fourthVC, animated: true)
    
    return true
  }
}

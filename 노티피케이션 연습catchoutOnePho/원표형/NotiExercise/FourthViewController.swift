//
//  FourthViewController.swift
//  NotiExercise
//
//  Created by HongWeonpyo on 05/05/2019.
//  Copyright © 2019 ShoppingBook. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

  let textDisplayLabel: UILabel = {
    let textDisplayLabel = UILabel()
    textDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
//    textDisplayLabel.text = ""
    return textDisplayLabel
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configurate()
    addSubview()
    autoLayout()
//    noti()
  }
  
  func configurate() {
    textDisplayLabel.backgroundColor = .yellow
  }
  
  func addSubview() {
    view.addSubview(textDisplayLabel)
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 20
    
    NSLayoutConstraint.activate([
      
        textDisplayLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 5),
        textDisplayLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
        textDisplayLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
        textDisplayLabel.heightAnchor.constraint(equalToConstant: 25)
      
      ])
  }
  
  func noti() {
    NotificationCenter.default.addObserver(self, selector: #selector(settingLabel(_:)), name: Notification.Name("ThirdViewText"), object: nil)
  }
  
  @objc func settingLabel(_ noti: Notification) {
    
    guard let text = noti.userInfo?["text"] as? String else { return }
    print(text)
    textDisplayLabel.text = text
  }
  
}

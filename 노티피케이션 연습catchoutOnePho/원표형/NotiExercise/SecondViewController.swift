//
//  SecondViewController.swift
//  NotiExercise
//
//  Created by HongWeonpyo on 04/05/2019.
//  Copyright © 2019 ShoppingBook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  let colorView: UIView = {
    let colorView = UIView()
    colorView.translatesAutoresizingMaskIntoConstraints = false
    return colorView
  }()
  
  let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
      addSubview()
      autoLayout()
      noti()
      
    }
  
  func addSubview() {
    view.addSubview(colorView)
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 30
    
    NSLayoutConstraint.activate([
      
      colorView.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 2),
      colorView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      colorView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      colorView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin * 2)
    
      ])
  }
  
  func noti() {
    notiCenter.addObserver(self, selector: #selector(changingColor(_:)), name: Notification.Name("colorChangeNotification"), object: nil)
  }
  
  
  @objc func changingColor(_ noti: Notification) {
    guard let color = noti.userInfo?["color"] as? UIColor else { return }
    
    print(color)
    colorView.backgroundColor = color
  }
  
  deinit {
    print(1)
    NotificationCenter.default.removeObserver(self)
  }
  
  
  
}


extension SecondViewController {
  var colorChangeNotification: Notification.Name {
    return Notification.Name("colorChangeNotification")
  }
}

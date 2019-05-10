//
//  ViewController.swift
//  NotiExercise
//
//  Created by HongWeonpyo on 04/05/2019.
//  Copyright © 2019 ShoppingBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let redLabel: UILabel = {
    let redLabel = UILabel()
    redLabel.translatesAutoresizingMaskIntoConstraints = false
    return redLabel
  }()
  
  let greenLabel: UILabel = {
    let greenLabel = UILabel()
    greenLabel.translatesAutoresizingMaskIntoConstraints = false
    return greenLabel
  }()
  
  let blueLabel: UILabel = {
    let blueLabel = UILabel()
    blueLabel.translatesAutoresizingMaskIntoConstraints = false
    return blueLabel
  }()
  
  let alphaLabel: UILabel = {
    let alphaLabel = UILabel()
    alphaLabel.translatesAutoresizingMaskIntoConstraints = false
    return alphaLabel
  }()
  
  let redSlider: UISlider = {
    let redSlider = UISlider()
    redSlider.setValue(0.5, animated: true)
    redSlider.translatesAutoresizingMaskIntoConstraints = false
    return redSlider
  }()
  
  let greenSlider: UISlider = {
    let greenSlider = UISlider()
    greenSlider.setValue(0.5, animated: true)
    greenSlider.translatesAutoresizingMaskIntoConstraints = false
    return greenSlider
  }()
  
  let blueSlider: UISlider = {
    let blueSlider = UISlider()
    blueSlider.setValue(0.5, animated: true)
    blueSlider.translatesAutoresizingMaskIntoConstraints = false
    return blueSlider
  }()
  
  let alphaSlider: UISlider = {
    let alphaSlider = UISlider()
    alphaSlider.setValue(0.5, animated: true)
    alphaSlider.translatesAutoresizingMaskIntoConstraints = false
    return alphaSlider
  }()
  
  let setButton: UIButton = {
    let setButton = UIButton()
    setButton.translatesAutoresizingMaskIntoConstraints = false
    return setButton
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configurate()
    addSubview()
    autoLayout()
  }

  func configurate() {
    redLabel.text = "Red"
    redLabel.font = UIFont.boldSystemFont(ofSize: 20)
    redLabel.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    greenLabel.text = "Green"
    greenLabel.font = UIFont.boldSystemFont(ofSize: 20)
    greenLabel.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    blueLabel.text = "Blue"
    blueLabel.font = UIFont.boldSystemFont(ofSize: 20)
    blueLabel.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    alphaLabel.text = "Alpha"
    alphaLabel.font = UIFont.boldSystemFont(ofSize: 20)
    alphaLabel.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    setButton.setTitle("Set Button", for: .normal)
    setButton.setTitleColor(.black, for: .normal)
    setButton.addTarget(self, action: #selector(setColorButton(_:)), for: .touchUpInside)
  }
  
  func addSubview() {
    view.addSubview(redLabel)
    view.addSubview(greenLabel)
    view.addSubview(blueLabel)
    view.addSubview(alphaLabel)
    
    view.addSubview(redSlider)
    view.addSubview(greenSlider)
    view.addSubview(blueSlider)
    view.addSubview(alphaSlider)
    
    view.addSubview(setButton)
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 30
    
    
    
    NSLayoutConstraint.activate([
      
      redLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
      redLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      redLabel.centerYAnchor.constraint(equalTo: redSlider.centerYAnchor),
      
      redSlider.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
      redSlider.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: margin / 2),
      redSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      redSlider.widthAnchor.constraint(equalTo: redLabel.widthAnchor, multiplier: 3),
      
      greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: margin),
      greenLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      greenLabel.centerYAnchor.constraint(equalTo: greenSlider.centerYAnchor),
      
      greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: margin),
      greenSlider.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: margin / 2),
      greenSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      greenSlider.widthAnchor.constraint(equalTo: greenLabel.widthAnchor, multiplier: 3),
      
      blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: margin),
      blueLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      blueLabel.centerYAnchor.constraint(equalTo: blueSlider.centerYAnchor),
      
      blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: margin),
      blueSlider.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor, constant: margin / 2),
      blueSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      blueSlider.widthAnchor.constraint(equalTo: blueLabel.widthAnchor, multiplier: 3),
      
      alphaLabel.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: margin),
      alphaLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      alphaLabel.centerYAnchor.constraint(equalTo: alphaSlider.centerYAnchor),
      
      alphaSlider.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: margin),
      alphaSlider.leadingAnchor.constraint(equalTo: alphaLabel.trailingAnchor, constant: margin / 2),
      alphaSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      alphaSlider.widthAnchor.constraint(equalTo: alphaLabel.widthAnchor, multiplier: 3),

      
      setButton.topAnchor.constraint(equalTo: alphaLabel.bottomAnchor, constant: 40),
      setButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
      
      ])
  }

  @objc func setColorButton(_ noti: UIButton) {
    let red = CGFloat(redSlider.value)
    let green = CGFloat(greenSlider.value)
    let blue = CGFloat(blueSlider.value)
    let alpha = CGFloat(alphaSlider.value)
    
    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    
    NotificationCenter.default.post(name: Notification.Name("colorChangeNotification"), object: nil, userInfo: ["color": color])
  }
}


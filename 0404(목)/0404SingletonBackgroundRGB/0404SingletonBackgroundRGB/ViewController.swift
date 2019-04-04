//
//  ViewController.swift
//  0404SingletonBackgroundRGB
//
//  Created by brian은석 on 04/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class Singleton {
    static let standard = Singleton()
    private init(){}
    var redValue :CGFloat = 0
    var greenValue :CGFloat = 0
    var blueValue :CGFloat = 0
}

class ViewController: UIViewController {
    let sliderRed = UISlider()
    let sliderGreen = UISlider()
    let sliderBlue = UISlider()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlide()

    }
    func makeSlide(){
        sliderRed.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 40)
        sliderRed.addTarget(self, action: #selector(colorSave), for: .valueChanged)
        view.addSubview(sliderRed)
        
        
        sliderGreen.frame = CGRect(x: 20 , y: 400, width: view.frame.width - 40, height: 40)
        sliderGreen.addTarget(self, action: #selector(colorSave), for: .valueChanged)

        view.addSubview(sliderGreen)

        
        sliderBlue.frame = CGRect(x: 20, y: 650, width: view.frame.width - 40, height: 40)
        sliderBlue.addTarget(self, action: #selector(colorSave), for: .valueChanged)

        view.addSubview(sliderBlue)
        
        let button = UIButton()
        button.frame = CGRect(x: 200, y: 800, width: 80, height: 80)
        button.setTitle("넘어간다", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.backgroundColor = .yellow
        view.addSubview(button)
    }
    @objc func colorSave() {
        Singleton.standard.redValue = CGFloat(sliderRed.value)
        Singleton.standard.greenValue = CGFloat(sliderGreen.value)
        Singleton.standard.blueValue = CGFloat(sliderBlue.value)

    }
    @objc func tapButton(){
        let scVC = SecondViewController()
        scVC.view.backgroundColor = UIColor(red: Singleton.standard.redValue, green: Singleton.standard.greenValue, blue: Singleton.standard.blueValue, alpha: 1)
        present(scVC, animated: true)
    }
  
   
    
    
}


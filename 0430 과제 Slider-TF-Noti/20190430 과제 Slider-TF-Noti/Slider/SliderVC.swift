//
//  SliderVC.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by hyeoktae kwon on 30/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
extension Notification.Name {
    static let randomColorNoti = Notification.Name("randomColor")
}

class SliderVC: UIViewController {
    
    var color = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
    
    var arr : [UIView] = []
    var noti = NotificationCenter.default
    let button = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        view.backgroundColor = .white
  
    }
    
    @objc func test(_ : UISlider) {
        let r = CGFloat(((arr[0] as? CustomView)?.slide.value)!)
        let g = CGFloat(((arr[1] as? CustomView)?.slide.value)!)
        let b = CGFloat(((arr[2] as? CustomView)?.slide.value)!)
        let a = CGFloat(((arr[3] as? CustomView)?.slide.value)!)
        
        color = .init(red: r, green: g, blue: b, alpha: a)
        
        noti.post(name: .randomColorNoti, object: color)

    }
    func makeView() {
        for x in (0...3) {
        let customView = CustomView()
            if x == 0 {
                customView.label.text = "RED"
                customView.slide.addTarget(self, action: #selector(test(_:)), for: .valueChanged)
            } else if x == 1 {
                customView.label.text = "GREEN"
                customView.slide.addTarget(self, action: #selector(test(_:)), for: .valueChanged)
            } else if x == 2 {
                customView.label.text = "BLUE"
                customView.slide.addTarget(self, action: #selector(test(_:)), for: .valueChanged)
            } else {
                customView.label.text = "Alpha"
                customView.slide.addTarget(self, action: #selector(test(_:)), for: .valueChanged)
            }
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            arr.append(customView)
        button.frame = CGRect(x: 30, y: 80, width: 60, height: 60)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(dismissButton), for: .touchUpInside)
            view.addSubview(button)
            
        }
        for x in (0...3) {
            if x == 0 {
                arr[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            } else {
                arr[x].topAnchor.constraint(equalTo: arr[x-1].bottomAnchor, constant:  50).isActive = true
            }
        }
    }
    @objc func dismissButton() {
        presentingViewController?.dismiss(animated: true)
    }
}

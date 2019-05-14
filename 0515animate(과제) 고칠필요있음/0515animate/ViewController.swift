//
//  ViewController.swift
//  0515animate
//
//  Created by brian은석 on 14/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    var buttonBool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
    }
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0 ... 1.0)
        let green = CGFloat.random(in: 0 ... 1.0)
        let blue = CGFloat.random(in: 0 ... 1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func makeView() {
        let arr = [button4,button3,button2,button1]
        var count = arr.count
        for x in arr {
            count -= 1
        view.addSubview(x)
        x.frame = CGRect(x: 250, y: view.frame.height - 250, width: 80, height: 80)
            x.backgroundColor = randomColor()
            x.layer.cornerRadius = x.frame.width / 2
            x.setTitle("버튼 \(count)", for: .normal)
            x.setTitleColor(.white, for: .normal)
        }
         button4.frame = CGRect(x: button1.center.x, y: view.frame.height - 250, width: 10, height: 10)
            button3.frame = CGRect(x: button1.center.x, y: view.frame.height - 250, width: 10, height: 10)
            button2.frame = CGRect(x: button1.center.x, y: view.frame.height - 250, width: 10, height: 10)
        self.button2.layer.cornerRadius = self.button2.frame.width / 2
        self.button3.layer.cornerRadius = self.button3.frame.width / 2
        self.button4.layer.cornerRadius = self.button4.frame.width / 2

        button1.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    @objc func buttonAction(sender:UIButton){
        if buttonBool {
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.button2.frame = CGRect(x: 250, y: self.button1.frame.minY - 120,width: 80, height: 80)
                self.button3.frame = CGRect(x: self.button1.center.x, y: self.button1.frame.minY - 120,width: 5, height: 5)
                self.button4.frame = CGRect(x: self.button1.center.x, y: self.button1.frame.minY - 120,width: 5, height: 5)
                self.button2.layer.cornerRadius = self.button2.frame.width / 2
                self.button3.layer.cornerRadius = self.button3.frame.width / 2
                self.button4.layer.cornerRadius = self.button3.frame.width / 2
                self.button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                self.button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                self.button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                self.button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)



            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.button3.frame = CGRect(x: self.button2.frame.minX, y: self.button2.frame.minY - 120,width: 80, height: 80)
                 self.button4.frame = CGRect(x: self.button2.center.x, y: self.button2.frame.minY - 120,width: 5, height: 5)
                self.button4.layer.cornerRadius = self.button4.frame.width / 2
                self.button3.layer.cornerRadius = self.button3.frame.width / 2
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
             
                self.button4.frame = CGRect(x: self.button3.frame.minX, y: self.button3.frame.minY - 120,width: 80, height: 80)
                self.button4.layer.cornerRadius = self.button4.frame.width / 2
            })
            self.buttonBool = false }
    )} else if !buttonBool {
            let size:CGFloat = 15
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                    self.button4.frame = CGRect(x: self.button3.center.x, y: self.button3.center.y,width: size, height: size)
                    self.button4.layer.cornerRadius = self.button4.frame.width / 2
                    self.button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 4)

                })
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    
                    self.button3.frame = CGRect(x: self.button2.center.x, y: self.button2.center.y,width: size, height: size)
                    self.button4.frame = CGRect(x: self.button2.center.x, y: self.button2.center.y,width: size, height: size)
                    self.button4.layer.cornerRadius = self.button4.frame.width / 2
                    self.button3.layer.cornerRadius = self.button3.frame.width / 2
                    self.button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 4)

                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.button2.frame = CGRect(x: self.button1.center.x, y: self.button1.center.y,width: size, height: size)
                    self.button3.frame = CGRect(x: self.button1.center.x, y: self.button1.center.y,width: size, height: size)
                    self.button4.frame = CGRect(x: self.button1.center.x, y: self.button1.center.y,width: size, height: size)
                    self.button2.layer.cornerRadius = self.button2.frame.width / 2
                    self.button3.layer.cornerRadius = self.button3.frame.width / 2
                    self.button4.layer.cornerRadius = self.button4.frame.width / 2
                    
                    self.button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 4)

                    
                })

                
                
                self.buttonBool = true })
        }
    }

}


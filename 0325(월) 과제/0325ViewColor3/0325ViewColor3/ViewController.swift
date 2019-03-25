//
//  ViewController.swift
//  0325ViewColor3
//
//  Created by brian은석 on 25/03/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView1()
        makeView2()
        makeView3()
    }

    func makeView1(){
        view1.frame = CGRect(x: 30, y: 30, width: view.frame.width - 60 , height: view.frame.height - 60)
        view1.backgroundColor = .blue
        view.addSubview(view1)
    }
    func makeView2() {
        view2.frame = CGRect(x: 30, y: 30, width: view1.frame.width - 60 , height: view1.frame.height - 60)
        view2.backgroundColor = .green
        view1.addSubview(view2)
    }
    func makeView3() {
        view3.frame = CGRect(x: 30, y: 30, width: view2.frame.width - 60 , height: view2.frame.height - 60)
        view3.backgroundColor = .red
        view2.addSubview(view3)
    }
}


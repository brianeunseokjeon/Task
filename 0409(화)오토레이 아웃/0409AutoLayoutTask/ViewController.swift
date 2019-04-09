//
//  ViewController.swift
//  0409AutoLayoutTask
//
//  Created by brian은석 on 09/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = .black
        view2.backgroundColor = .black
        view3.backgroundColor = .black
        view4.backgroundColor = .black
        view5.backgroundColor = .black
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        autoLayout()

    }
    func autoLayout() {
       view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false

        
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        view2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 8).isActive = true
        view2.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        
        view3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 8).isActive = true
        view3.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 0.7, constant: -2).isActive = true

        view4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view4.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 8).isActive = true
        view4.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.7, constant: -3).isActive = true

        view5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view5.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        view5.widthAnchor.constraint(equalTo: view4.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        view5.leadingAnchor.constraint(equalTo: view4.trailingAnchor, constant: 8).isActive = true


    }

}


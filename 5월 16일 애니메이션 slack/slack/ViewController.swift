//
//  ViewController.swift
//  slack
//
//  Created by brian은석 on 16/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let createWSButton: UIButton = { () -> UIButton in
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.addTarget(self, action: #selector(didTapCreateWSButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createWSButton)
        createWSButton.translatesAutoresizingMaskIntoConstraints = false
        createWSButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createWSButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func didTapCreateWSButton(_ sender: UIButton) {
        let vc = NameWSViewController()
        let naviController = UINavigationController(rootViewController: vc)
        present(naviController,animated: true)
    }
    
    
    
}


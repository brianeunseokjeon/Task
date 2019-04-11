//
//  ThirdViewController.swift
//  0409ManagerTask
//
//  Created by brian은석 on 09/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let yellowButton = UIButton()
    let whiteButton = UIButton()
    let view1 = UIView()
    let dismissButton = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = .blue
        view.addSubview(view1)
        view1.addSubview(dismissButton)
        view1.addSubview(whiteButton)
        view1.addSubview(yellowButton)
        dismissButton.backgroundColor = .red
        whiteButton.backgroundColor = .white
        yellowButton.backgroundColor = .yellow
        view1.addSubview(label)

        autolayOut()
    }
    func autolayOut() {
       // 이거 안써주면 작동안됨....진짜 중요합니다.
        view1.translatesAutoresizingMaskIntoConstraints = false
        whiteButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view1.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.text = "색을 변경하시겠습니까"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        view1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        
        dismissButton.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -30).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 10).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -10).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
//dismissButton.contentHuggingPriority(for: <#T##NSLayoutConstraint.Axis#>)
        
        
        
        yellowButton.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 30).isActive = true
        yellowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        yellowButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        yellowButton.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -200).isActive = true
       
        
        whiteButton.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -30).isActive = true
        whiteButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        whiteButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        whiteButton.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -200).isActive = true
        
        yellowButton.setTitle("배경색 노랑", for: .normal)
        yellowButton.addTarget(self, action: #selector(yellow), for: .touchUpInside)
        yellowButton.setTitleColor(.black, for: .normal)
        
        
        whiteButton.setTitle("배경색 흰색", for: .normal)
        whiteButton.addTarget(self, action: #selector(white), for: .touchUpInside)
        whiteButton.setTitleColor(.black, for: .normal)
        // 버튼 눌렀을 때 색깔을 변하게 할 수 도 잇음.
        
        whiteButton.layer.cornerRadius = 50
        yellowButton.layer.cornerRadius = 50
        
        dismissButton.setTitle("넘어간다", for: .normal)
        dismissButton.addTarget( self, action: #selector(dismiss1), for: .touchUpInside)
        dismissButton.layer.cornerRadius = 30
        
    }

    @objc func dismiss1(){
        (presentingViewController as? ViewController)?.dismiss(animated: true)
    }
    @objc func white(){
        (presentingViewController as? ViewController)?.view.backgroundColor = .white
    }
    @objc func yellow(){
        (presentingViewController as? ViewController)?.view.backgroundColor = .yellow
    }
}

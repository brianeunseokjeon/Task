//
//  ViewController.swift
//  UIViewControllerAdd1
//
//  Created by brian은석 on 26/03/2019.
//  Copyright © 2019 brian. All rights reserved.


//    ViewController 데이터 전달
//    > AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
//    > AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가

import UIKit

class AViewController: UIViewController {

    
    var count = 0
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        

    }
    func makeView(){
        label.frame = CGRect(x: 70, y: 30, width: 280, height: 80)
        label.backgroundColor = .yellow
        label.text = "\(self.count)"
        view.addSubview(label)
        
        
        
        let button = UIButton()
        button.frame = CGRect(x: 160, y: 300, width: 100, height: 80)
        button.setTitle("2번 View로 이동", for: .normal)
        button.addTarget(self, action: #selector(moveB), for: .touchUpInside)
        button.backgroundColor = .blue
        view.addSubview(button)
    }
    
    @objc func moveB(){
        let bViewController = BViewController()
        count += 1
        print(count)
        bViewController.count = count
        present(bViewController,animated: true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        label.text = "\(self.count)"

    }

}


//
//  ViewController.swift
//  0409ManagerTask
//
//  Created by brian은석 on 09/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       makeView()
    }
    @IBAction func presentButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController")
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC , animated: true)
    }
    
    func makeView() {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 300, width: view.frame.width - 200 , height: 100)
        button.setTitle("넘어간다", for: .normal)
        button.addTarget(self, action: #selector(pass), for: .touchUpInside)
        button.backgroundColor = .red
        view.addSubview(button)
    }
    
    @objc func pass(){
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .overCurrentContext
        present(thirdVC , animated: true)
    }
    
}


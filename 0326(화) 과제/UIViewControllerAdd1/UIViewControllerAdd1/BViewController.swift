//
//  BViewController.swift
//  UIViewControllerAdd1
//
//  Created by brian은석 on 26/03/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        view.backgroundColor = .white
        
        
    }
    func makeView(){
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 30, width: 280, height: 80)
        label.backgroundColor = .blue
        label.text = "\(self.count)"
        view.addSubview(label)
        
        
        let button = UIButton()
        button.frame = CGRect(x: 160, y: 300, width: 100, height: 80)
        button.setTitle("디스미스", for: .normal)
        button.addTarget(self, action: #selector(dismissA), for: .touchUpInside)
        button.backgroundColor = .green
        view.addSubview(button)
    }
    
    @objc func dismissA(){
        guard let vc = presentingViewController as? ViewController else {return}
        count += 1
        print(count)
        vc.count = count
        presentingViewController?.dismiss(animated: true)
        
    }
    
    
    
}

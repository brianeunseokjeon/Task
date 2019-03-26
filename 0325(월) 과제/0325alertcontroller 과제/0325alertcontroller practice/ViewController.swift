//
//  ViewController.swift
//  0325alertcontroller practice
//
//  Created by brian은석 on 25/03/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let labelview = UILabel()
    var count = 0
    func makeView() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 200, y: 300, width: 80, height: 35)
        button.setTitle("버튼", for:  .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        labelview.frame = CGRect(x: 200, y: 50, width: 100, height: 100)
        labelview.backgroundColor = .yellow
        view.addSubview(labelview)
        labelview.text = "\(self.count)"
        labelview.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
     
    }
    
    
    @objc func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(
            title: "카운트 추가?", message: nil , preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let k = alertController.textFields?[0].text {
                if k.isEmpty {
                    self.count += 1
                } else {
                    self.count += Int(k) ?? 0
                }
                self.labelview.text = "\(self.count)"
            }
            
            
        }
        let reset = UIAlertAction(title: "reset", style: .default) { _ in
         
            self.count = 0
            self.labelview.text = "\(self.count)"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        
        alertController.addTextField()
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(reset)
        present(alertController, animated: true)
    }
  
    
    
}


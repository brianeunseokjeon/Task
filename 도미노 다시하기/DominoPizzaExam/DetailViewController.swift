//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    var countData = Product(name: "", price: 0, count: 0) {
        didSet {
            displayLabel.text = "\(self.countData.count) 개"
        }
    }
    let imageView = UIImageView()
    let tempView = UIView()
    let minusButton = UIButton()
    let displayLabel = UILabel()
    let plusButton = UIButton()
    
    var productName = "" {
        didSet {
            navigationItem.title = productName
        }
    }
    
    let shared = SingleTon.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        for x in shared.wishListDict.keys {
            if x == countData.name {
                countData.count = shared.wishListDict[x]!
            }
        }
        
    }
  @objc func buttonAction(_ sender:UIButton){
        if sender.tag == 0 {
            guard countData.count != 0 else { return }
            countData.count -= 1
            if (shared.wishListDict[countData.name] != nil) {
                shared.wishListDict[countData.name] = countData.count
            }
            if shared.wishListDict[countData.name] == 0 {
                shared.wishListDict.removeValue(forKey: countData.name)
            }
        }
        if sender.tag == 1 {
            countData.count += 1
            if (shared.wishListDict[countData.name] != nil) {
                shared.wishListDict[countData.name] = countData.count
            } else {
                shared.wishListDict[countData.name] = countData.count
            }
        }
    print(shared.wishListDict)
    }
    
    
    
    private func configure() {
      
        view.addSubview(imageView)
        
        view.addSubview(tempView)
        
        minusButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        minusButton.tag = 0
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.borderWidth = 3
        minusButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tempView.addSubview(minusButton)
        
        displayLabel.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        displayLabel.textAlignment = .center
        displayLabel.textColor = .white
        tempView.addSubview(displayLabel)
        
        plusButton.tag = 1
        plusButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.borderWidth = 3
        plusButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tempView.addSubview(plusButton)
    }
    
    private func autoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        tempView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        tempView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: tempView.leadingAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        displayLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
        displayLabel.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        displayLabel.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.6).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: displayLabel.trailingAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: tempView.trailingAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
    }
    
}

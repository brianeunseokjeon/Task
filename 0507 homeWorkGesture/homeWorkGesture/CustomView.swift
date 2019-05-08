//
//  CustomView.swift
//  homeWorkGesture
//
//  Created by brian은석 on 07/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class CustomView: UIView {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
   private func setupUI() {
    let group: [UIView] = [nameLabel,countLable]
    for x in group {
        self.addSubview(x)
    }
    
    nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    nameLabel.backgroundColor = .yellow
    
    
    countLable.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    countLable.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor,constant: 20).isActive = true
    countLable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    countLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  AvatarView.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        self.addSubview(imageView)
        self.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true

        
        self.addSubview(nameLabel)
        self.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

        nameLabel.text = "미미"
    }
    
    func settingAvatar(image:String, name:String) {
        imageView.image = UIImage(named: image)
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
    }
    
}

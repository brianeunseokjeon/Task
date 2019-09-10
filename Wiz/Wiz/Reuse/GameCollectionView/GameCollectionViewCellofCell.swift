//
//  GameCollectionViewCellofCell.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class GameCollectionViewCellofCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    var avatarView = AvatarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    private func setupUI() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.frame.width-6).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.text = "퍼즐팡팡!"
        
        self.addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        avatarView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        avatarView.backgroundColor = .blue

        setting(title: "GoGoSea",gameImage: "sea" ,Userimage: "character", id: "너구리")
    }
    
    func setting(title:String, gameImage:String, Userimage:String, id:String) {
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        imageView.image = UIImage(named: gameImage)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        avatarView.settingAvatar(image: Userimage, name: id)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

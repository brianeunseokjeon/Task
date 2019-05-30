//
//  SectionHeaderView.swift
//  CollectionViewExample
//
//  Created by giftbot on 30/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    
    // 블러처리.. 이거 흐릿하게 보이는거 (안경벗었을때 보이는것처럼)
    private let blurView = UIVisualEffectView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.effect = blurEffect
        addSubview(blurView)        //self. 생략됨.
        
        blurView.contentView.addSubview(imageView)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        blurView.contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        [blurView, imageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.75),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5),
            
            titleLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            ])
    }
    
    // MARK: Configure
    func configure(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}

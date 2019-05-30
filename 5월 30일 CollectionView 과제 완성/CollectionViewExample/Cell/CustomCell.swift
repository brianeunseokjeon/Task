//
//  CustomCell.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
  static let identifier = "CustomCell"
  
    //private  으로해놔서 건들지 못하게 한거임..
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
  
    private func setupViews() {
        // 이미지뷰에서는 밖으로 삐져나오는 부분 잡는 코드.... 밑에꺼 없으면 스페이싱 적용안됨..
        clipsToBounds = true
        layer.cornerRadius = 20
        
        // imageView
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        // titleLabel
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        [imageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            ])
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
  
  // MARK: Configure Cell
    
    // 굳이 프라이빗으로 하는 이유는?? 속성이 더 많아지면, 정확하게 어떤것을 건들여야할지 명확하게 알지못하므로..
    // 이미지뷰의 어떤 특성이나, 타이틀레이블의 폰트를 바꾸면안되는데 마음대로 바꾸면 안되기때문에 
    func configure(image: UIImage?, title:String) {
        imageView.image = image
        titleLabel.text = title
    }
}

//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
protocol ButtonDelegate :class {
    func itemCell(_ customCell: ItemCell, didTapButton button: UIButton)
}

final class ItemCell: UITableViewCell {
    var button = UIButton()
    var imageView1 = UIImageView()
    var labelText = UILabel()
    var labelNumber = UILabel()
    
    weak var delegate :ButtonDelegate?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    //스토리보드로 만들었기ㄸ때문에 여기에 작성하는듯.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout()
    }
    
    func layout() {
        contentView.addSubview(button)
        contentView.addSubview(imageView1)
        contentView.addSubview(labelText)
        contentView.addSubview(labelNumber)

        
//        button.setImage(UIImage(named: "dog"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelNumber.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.heightAnchor ,constant: -30).isActive = true
        button.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonTask(_:)), for: .touchUpInside)
        
        imageView1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        imageView1.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

        
        
        labelText.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        labelText.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor).isActive = true
        labelText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        labelText.widthAnchor.constraint(equalTo: labelText.heightAnchor, multiplier: 3).isActive = true
        labelText.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

        
        labelNumber.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        labelNumber.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        labelNumber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -30).isActive = true
        labelNumber.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30).isActive = true
        labelNumber.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

    }
    @objc func buttonTask(_ sender: UIButton){
        delegate?.itemCell(self, didTapButton: sender)
    }
    
}

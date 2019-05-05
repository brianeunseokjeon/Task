//
//  CustomCell.swift
//  DominoPizzaExam
//
//  Created by brian은석 on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    let customImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customImageView)
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
//
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class CustomCell2 : UITableViewCell {
    let customImageView2 = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customImageView2)
        customImageView2.translatesAutoresizingMaskIntoConstraints = false
        customImageView2.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customImageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        customImageView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        customImageView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

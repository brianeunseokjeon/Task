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

        self.translatesAutoresizingMaskIntoConstraints = false
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

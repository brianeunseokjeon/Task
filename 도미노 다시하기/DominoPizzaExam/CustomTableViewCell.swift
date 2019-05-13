//
//  CustomTableViewCell.swift
//  DominoPizzaExam
//
//  Created by brian은석 on 13/05/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit



class CustomTableViewCell: UITableViewCell {
    let imageViewForCell = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
        self.autolayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(){
        self.addSubview(imageViewForCell)
        
    }
    func autolayout(){
        imageViewForCell.translatesAutoresizingMaskIntoConstraints = false
       
        imageViewForCell.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageViewForCell.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageViewForCell.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageViewForCell.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
}

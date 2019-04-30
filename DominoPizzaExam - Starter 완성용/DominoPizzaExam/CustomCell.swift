//
//  CustomCell.swift
//  DominoPizzaExam
//
//  Created by brian은석 on 29/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var FoodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


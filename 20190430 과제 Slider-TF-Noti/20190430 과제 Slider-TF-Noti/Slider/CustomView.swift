//
//  CustomView.swift
//  20190430 과제 Slider-TF-Noti
//
//  Created by brian은석 on 01/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var label = UILabel()
    let slide = UISlider()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        label.backgroundColor = #colorLiteral(red: 0.9061310887, green: 0.9154139161, blue: 0.5471322536, alpha: 1)
        
        self.addSubview(slide)
        slide.translatesAutoresizingMaskIntoConstraints = false
        slide.topAnchor.constraint(equalTo: label.topAnchor, constant: 20).isActive = true
        slide.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 30).isActive = true
        slide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        slide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
       
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

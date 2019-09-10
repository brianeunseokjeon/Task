//
//  Metric.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//


import UIKit

enum Metric {
    static let nextOffSet: CGFloat = 20
    static let itemSpacing: CGFloat = 10
    static let topEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static var topCellHorizontalPadding: CGFloat {
        return Metric.topEdgeInsets.left + Metric.topEdgeInsets.right
    }
    static var topCellVerticalPadding: CGFloat {
        return Metric.topEdgeInsets.top + Metric.topEdgeInsets.bottom
    }
    
    static let gameitemSpacing: CGFloat = 15
    static let gameEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: -5, right: 15)
    static var gameCellHorizontalPadding: CGFloat {
        return Metric.gameEdgeInsets.left + Metric.gameEdgeInsets.right + gameitemSpacing * 3
    }
    static var gameCellVerticalPadding: CGFloat {
        return Metric.gameEdgeInsets.top + Metric.gameEdgeInsets.bottom + gameitemSpacing * 2
    }
    
}





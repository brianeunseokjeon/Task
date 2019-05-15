//
//  ViewController.swift
//  ButtonAnimationExample
//
//  Created by giftbot on 14/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private struct Time {
    static let short = 0.3
    static let middle = 0.65
    static let long = 1.0
  }
  
    private struct UI {
        static let menuCount = 4
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.3
    }
    
    private var firstMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
    }
    
    private func randomColorGenerator() -> UIColor {
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    
    
    private func setupFirstMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 300, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
            }
            view.bringSubviewToFront(firstMenuContainer.first!)
        }
    }
    
    
    @objc func firstMenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        UIView.animateKeyframes(
            withDuration: Time.long,
            delay: 0,
            options: [.beginFromCurrentState],
            animations: {
                if sender.isSelected {
                for x in (1...self.firstMenuContainer.count - 1) {
                    var arr :[UIButton] = []
                    for k in (x...self.firstMenuContainer.count - 1) {
                        arr.append(self.firstMenuContainer[k])
                    }
                    UIView.addKeyframe(
                        withRelativeStartTime: Double(0.1 * Double(x) - 0.1),
                        relativeDuration: 0.1,
                        animations: {
                            for x in arr {
                                x.center.y -= UI.distance
                            }
                            arr[0].transform = .identity
                    })
                    
                    }
                } else {
                    for x in (1...self.firstMenuContainer.count - 1).reversed() {
                        var arr :[UIButton] = []
                        for k in (x...self.firstMenuContainer.count - 1) {
                            arr.append(self.firstMenuContainer[k])
                        }
                        UIView.addKeyframe(
                            withRelativeStartTime: Double(0.1 * Double(arr.count) -  0.1 ),
                            relativeDuration: 0.1,
                            animations: {
                                for x in arr {
                                    x.center.y += UI.distance
                                    x.transform = x.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                                }
                        })
                        
                    }
                }
        }
    )}
}

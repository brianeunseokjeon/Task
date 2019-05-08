//
//  ViewController.swift
//  homeWorkGesture
//
//  Created by brian은석 on 07/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
     let view1 = CustomView()
    let view2 = CustomView()

    var saveX: CGFloat = 0
    var saveY: CGFloat = 0

    
    var count: Int = 0 {
        didSet {
            view1.countLable.text = "\(count) 번"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
    }
    func makeView() {
        let guaid = view.safeAreaLayoutGuide
       
        view1.nameLabel.text = "횟수 :"
        view1.countLable.text = "\(count) 번 "
        view2.nameLabel.text = "좌표 :"
        view2.countLable.text = "( \(String(format: "%.1f", saveX)), \(String(format: "%.1f", saveY)) )"
        
        
        
        
        let arr = [view1,view2]
        
        for x in arr {
            view.addSubview(x)
            x.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view1.topAnchor.constraint(equalTo: guaid.topAnchor, constant: 50).isActive = true
        view1.leadingAnchor.constraint(equalTo: guaid.leadingAnchor,constant: 20).isActive = true
        view1.trailingAnchor.constraint(equalTo: guaid.trailingAnchor).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10).isActive = true
        view2.leadingAnchor.constraint(equalTo: guaid.leadingAnchor,constant: 20).isActive = true
        view2.trailingAnchor.constraint(equalTo: guaid.trailingAnchor).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    var touchPoint: [CGPoint] = []
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: touch.view)
        saveX = touchLocation.x
        saveY = touchLocation.y
        
 view2.countLable.text = "( \(String(format: "%.1f", saveX)), \(String(format: "%.2f", saveY)) )"
        if touchPoint.isEmpty {
            touchPoint.append(touchLocation)
            count = 1
            return
        }
        let last = touchPoint.last
        touchPoint.append(touchLocation)
        if last!.x+10 > touchLocation.x && last!.x-10 < touchLocation.x && last!.y+10 > touchLocation.y && last!.y-10 < touchLocation.y   {
            count += 1
        } else {
            count = 1
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
    

    }
    

}


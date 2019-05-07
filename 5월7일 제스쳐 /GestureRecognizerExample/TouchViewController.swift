//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
  @IBOutlet private weak var imageView: UIImageView!
    var pointX: CGFloat = 0
    var pointY: CGFloat = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    //cornerRadius는 적용된상태지만.. 안나타남. 왜? 사진은 프레임을 벗어나니깐; >> 이미지도 이미지뷰에 맞춰 자를수 있는 메서드가 필요함.
    imageView.layer.cornerRadius = imageView.frame.width / 2
    
    // imageView.layer.masksToBounds = true
    // 둘중하나가 같은 뜻.. 이미지뷰의 영역을 벗어나는 것은 잘라냄.
    imageView.clipsToBounds = true

  }
    // 변수둘 생각어찌함?
    var isHoldingimage = false

    
    // 터치가 한손가락이 아닌 두손가락으로 진행될수있으므로'
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //손가락중에 첫번째로 터치된 것.
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        print("-----touchesBegan" ,touchPoint)
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat2")
            isHoldingimage = true
        }
         pointX = imageView.center.x - touchPoint.x
         pointY = imageView.center.y - touchPoint.y
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard isHoldingimage, let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
            imageView.center.x = touchPoint.x + pointX
            imageView.center.y = touchPoint.y + pointY

      
        print("-----touchesMoved" ,touchPoint)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        if imageView.frame.contains(touchPoint) {
        imageView.image = UIImage(named: "cat1")
            isHoldingimage = false
        }
        print("-----touchesEnded" ,touchPoint)
    }
    // 시스템에서 방해받는 상황이 나왔을때 뜸.. 갑자기 전화온다던가...
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        print("-----touchesCancelled" ,touchPoint)
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat1")
            isHoldingimage = false
        }
    }
    
}




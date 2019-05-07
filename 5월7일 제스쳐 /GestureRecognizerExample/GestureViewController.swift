//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
    
    let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
    swipeRecognizer.direction = .left
    self.view.addGestureRecognizer(swipeRecognizer)
    
    
    
    }
    @objc func swipeAction(_ sender :UISwipeGestureRecognizer){
        if sender.direction == .left{
            imageView.image = UIImage(named: "cat2")
        }
    }
        
        
    var isQuadruple = false
        
    @IBAction func handelTapGesture(_ sender: UITapGestureRecognizer) {
        print("Double")
        if !isQuadruple {
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        } else {
        imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
    }
    // 실행했을 때 옵션키 누르면 손가락 두개 누른것처럼 됨.
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        // 크기를 유지한채로 이미지뷰 돌릴려면 밑에껄로
        let rotation = sender.rotation
        imageView.transform = imageView.transform.rotated(by: rotation)
        sender.rotation = 0
        
        // 밑은 CGAffineTransform.identity (단위행렬로 바꾼상태에서(크기도 처음으로 돌아감..) 회전시킴)
//        imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
    }
    
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {

            if sender.direction == .right {
            imageView.image = UIImage(named: "cat1")
        }
    }
    
    
}

//
//  ViewController.swift
//  0402ThirdProblem
//
//  Created by brian은석 on 03/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

//
//3. 클래스 매니저 과제
//    - 첫번째 뷰에 레이블과 버튼을 생성하고 버튼을 통해 두번쨰 뷰로 이동.
//        - 두번째 뷰에는 segmentedController 를 생성하고 선택한값을 첫번째 뷰의 레이블에 띄우세요.

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var FirstViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToFirstView(_ unwindSegue: UIStoryboardSegue) {
        FirstViewLabel.text = (unwindSegue.source as? SecondViewController)?.h
    }
  
    
}


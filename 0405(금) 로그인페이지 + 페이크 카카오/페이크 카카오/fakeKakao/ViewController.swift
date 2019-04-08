//
//  ViewController.swift
//  fakeKakao
//
//  Created by brian은석 on 08/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "친구"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        var tempStr = ""
        for x in Friends.friend.save {                      // 배열에있는 원소를 하나씩 받아와서 변수에 저장.
            tempStr += "\(x)\n"                             // 저장하는 방법이 줄 바꿈.
        }                                                   // 주의사항: 텍스트필드의 lines 가 1로 지정되있어서                                                    이거 0으로 변경해줘야 눈에 보임.
        if tempStr == "" {
            label.text = "친구없음"
        } else {
        label.text = tempStr
        }
    }
}


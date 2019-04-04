//
//  SecondViewController.swift
//  0402ThirdProblem
//
//  Created by brian은석 on 03/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    var h = "-1"
    // var h :String?  이렇게 옵셔널 처리해놓으면 밑에서 옵셔널 풀지 않아도 됨!! 중요!!!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        guard let p = segmentView.titleForSegment(at: segmentView.selectedSegmentIndex) else {return}
        h = p
    }
}

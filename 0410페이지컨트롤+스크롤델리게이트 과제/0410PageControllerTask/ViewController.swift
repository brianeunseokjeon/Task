//
//  ViewController.swift
//  0410PageControllerTask
//
//  Created by brian은석 on 11/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//
// inset offset ( 수치값!!!!!!! 관련)
//
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)

        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(pageFraction)
    }
    
    
   
}


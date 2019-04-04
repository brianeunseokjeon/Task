//
//  ViewController.swift
//  0402segueTask
//
//  Created by brian은석 on 02/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var DogLabel: UILabel!
    @IBOutlet weak var CatLabel: UILabel!
    @IBOutlet weak var BirdLabel: UILabel!
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier else { return }
        
        if id == "Dog" {
            if let seVC = segue.destination as? SecondVC {
                seVC.imageAnimal = UIImage(named: "개")
            }
        } else if id == "Bird" {
            if let seVC = segue.destination as? SecondVC {
                seVC.imageAnimal = UIImage(named: "새")
            }
            
        }
        else {
            if let seVC = segue.destination as? SecondVC {
                seVC.imageAnimal = UIImage(named: "고양이")
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Dog" && dogCount < 8 {
            dogCount += 1
            DogLabel.text = "\(dogCount)"
            return true
        }
        if identifier == "Bird" && birdCount < 15 {
            birdCount += 1
            BirdLabel.text = "\(birdCount)"
            return true
        }
        if identifier == "Cat" && catCount < 10 {
            catCount += 1
            CatLabel.text = "\(catCount)"
            return true
        }
        return false
    }
    
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
      count = ((unwindSegue.source as? SecondVC)?.h) ?? 0
        dogCount += count
        catCount += count
        birdCount += count
        DogLabel.text = "\(dogCount)"
        BirdLabel.text = "\(birdCount)"
        CatLabel.text = "\(catCount)"
    }
}

//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    var num :Double = 0
    var save :Double = 0
    var plusCount = 0
    var minusCount = 0
    var multipleCount = 0
    var divisionCount = 0
    var equalCount = 0
    
    @IBOutlet weak var label: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
    
    
    // 이 함수는 소숫점 3자리까지 표현되며 정수계산은 정수로 표현가능하게끔.
    func changeNumber(num:Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        let numString = formatter.string(from: num as NSNumber)
        return numString ?? "0"
        
    }
    
    
    // 하나의 IBAction 에 여러개 연결가능하다 잊지말자...
    @IBAction func NumberButton(_ sender: UIButton) {
        let count = plusCount + minusCount + multipleCount + divisionCount
    
        if count == 1 {
            guard save < 100000000 else { return }
            save *= 10
            save += Double(sender.tag)
            label.text = changeNumber(num: save)
        } else if count != 1 {
            if  equalCount >= 1 {
                num = 0
                equalCount = 0
            }
            guard num < 100000000 else { return }
            num *= 10
            num += Double(sender.tag)
            label.text = changeNumber(num: num)
      
        }
    }
    
    //UI버튼으로 해줘야 sender 이용할수 있으니 명심..
    @IBAction func calculation(_ sender: UIButton) {

        calculate()
        save = 0
        label.text = changeNumber(num: num)
        countReset()
        if sender.tag == 11 {
        plusCount += 1
        } else if sender.tag == 12 {
            minusCount += 1
        } else if sender.tag == 13 {
            multipleCount += 1
        } else if sender.tag == 14 {
            divisionCount += 1
        }
    }
    
    
    @IBAction func equalButton(_ sender: UIButton) {
        calculate()
        countReset()
        save = 0
        label.text = changeNumber(num: num)
        equalCount += 1
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        countReset()
        num = 0
        save = 0
        label.text = changeNumber(num: num)
    }

    
    // save 값에 0 일때 곱셈과 나눗셈 버튼이 여러번 눌렸을때 계산되면 곱셈은 0이되고 나눗셈은 무한대값이 나와서 제한 둠
    func calculate(){
        if plusCount == 1 {
            num += save
        } else if minusCount == 1 {
            num -= save
        } else if multipleCount == 1 {
            if save == 0 {
                return
            }
            num *= save
        } else if divisionCount == 1 {
            if save == 0 {
                return
            }
            num /= save
        }
    }
    func countReset() {
        (plusCount, minusCount, multipleCount, divisionCount) = (0, 0, 0, 0)
    }

}

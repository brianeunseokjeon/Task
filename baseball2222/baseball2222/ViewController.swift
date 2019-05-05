//
//  ViewController.swift
//  baseball2222
//
//  Created by brian은석 on 05/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let lineView = UIView()
    let checkButton = UIButton()
    let resetButton = UIButton()
    let tableView = UITableView()
    
    var strNum = 145
    var saveNumArr : [Int] = []
    var resultArr : [String] = []
    var stringInt = 0
    var firstNum = 1
    var secondNum = 4
    var thirdNum = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        textField.delegate = self
        tableView.dataSource = self
    }

    func makeView() {
        let arr = [textField,lineView,checkButton,resetButton,tableView]
        for x in 0...arr.count - 1 {
            view.addSubview(arr[x])
            arr[x].translatesAutoresizingMaskIntoConstraints = false
        }
        // .isActive = true    한번에 갑시다??
        textField.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //textField 는 값이 변화할때마다는 editingChanged
        
        lineView.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 10).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        lineView.backgroundColor = .gray
        
        checkButton.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 50).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        checkButton.backgroundColor = #colorLiteral(red: 0.9061310887, green: 0.9154139161, blue: 0.5471322536, alpha: 1)
        checkButton.addTarget(self, action: #selector(saveNum(_:)), for: .touchUpInside)
        checkButton.addTarget(self, action: #selector(compare), for: .touchUpInside)
        checkButton.setTitle("확인!", for: .normal)
        checkButton.setTitleColor(.black, for: .normal)
        
        resetButton.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 50).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        resetButton.backgroundColor = #colorLiteral(red: 0.9061310887, green: 0.9154139161, blue: 0.5471322536, alpha: 1)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        resetButton.setTitle("다시 시작", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 350).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func reset() {
        var numArr :[Int] = []
        strNum = 0
        for _ in 0...2 {
            let randomNuber = Int.random(in: 0...9)
            guard numArr.count != 3 else { return }
            
            if numArr.count == 0 && randomNuber != 0 {
                numArr.append(randomNuber)
            } else if numArr.count != 0 && !numArr.contains(randomNuber) {
                numArr.append(randomNuber)
            } else { reset() ; return }
        }
        for x in numArr {
            strNum *= 10
            strNum += x
        }
        firstNum = strNum / 100
        secondNum = (strNum / 10) % 10
        thirdNum = strNum % 10
        saveNumArr = []
        resultArr = []
        tableView.reloadData()
        
    }
    @objc func saveNum(_ sender:UIButton) {
        guard textField.text != "" else { return }
        stringInt = Int(textField.text ?? "0") ?? 0
        saveNumArr.append(stringInt)
        tableView.reloadData()
    }
    @objc func compare()  {
        guard textField.text != "" else { return }

        stringInt = Int(textField.text ?? "0") ?? 0
        var ballCount = 0
        var strikeCount = 0
        let compareFirstNum = stringInt / 100
        let compareSeconNum = (stringInt / 10) % 10
        let compareThirdNum = stringInt % 10
        
        if compareFirstNum == firstNum {
            strikeCount += 1
        } else if compareFirstNum == secondNum {
            ballCount += 1
        } else if compareFirstNum == thirdNum {
            ballCount += 1
        }
        if compareSeconNum == firstNum {
            ballCount += 1
        } else if compareSeconNum == secondNum {
            strikeCount += 1
        } else if compareSeconNum == thirdNum {
            ballCount += 1
        }
        if compareThirdNum == firstNum {
            ballCount += 1
        } else if compareThirdNum == secondNum {
            ballCount += 1
        } else if compareThirdNum == thirdNum {
            strikeCount += 1
        }
        
        resultArr.append("strike: \(strikeCount)개, ball: \(ballCount)개 ")
        
        textField.text = ""
    }
    
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveNumArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1) 번째, \(saveNumArr[indexPath.row]), 결과값: \(resultArr[indexPath.row])"
        return cell
    }
}

extension ViewController :UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
       
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
    return string.rangeOfCharacter(from: invalidCharacters) == nil && updatedText.count <= 3
    }
}


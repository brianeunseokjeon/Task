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
    
    //처음 시작 숫자.
    var strNum = 145
    //텍스트 필드에 입력한 글자를 인트로 바꿈.
    var stringInt = 0
    // 내가 텍스트 필드에 입력한 숫자 저장.
    var saveNumArr : [Int] = []
    // ball , strike 갯수 저장 배열.
    var resultArr : [String] = []
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        textField.delegate = self
        tableView.dataSource = self
    }
// 뷰 만든다!
    func makeView() {
        let arr = [textField,lineView,checkButton,resetButton,tableView]
        for x in 0...arr.count - 1 {
            view.addSubview(arr[x])
            arr[x].translatesAutoresizingMaskIntoConstraints = false
        }
       
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
        checkButton.addTarget(self, action: #selector(saveNumAndCompareNumber), for: .touchUpInside)
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
    
    // 첫째자리, 둘째자리, 셋째자리 뽑아주는 일반화 함수..
    func getDigit(number: Double, digit: Double) -> Int{
        let power = Int(pow(10, (digit-1)))
        return (Int(number) / power) % 10
    }
    
    // 말그대로 다시 리셋하기 위한 함수
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
        
        saveNumArr = []
        resultArr = []
        tableView.reloadData()
        
    }
    // MARK: - 고칠부분 1 아직 한글자,두글자도 저장됨;;
    // 텍스트 필드에 있는 글자 숫자롭 변경..
    
    // 볼, 스트라이크 비교하는 곳.
    
    @objc func saveNumAndCompareNumber()  {
        guard textField.text != "" else { return }

        stringInt = Int(textField.text ?? "0") ?? 0
        
        guard stringInt != strNum else {
            let alert = UIAlertController(title: "축하합니다", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in self.reset()}
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(okAction)
            alert.addAction(cancel)
            present(alert, animated: true)
            textField.text = ""

            return
            }
        
        saveNumArr.append(stringInt)
        tableView.reloadData()
        
        var ballCount = 0
        var strikeCount = 0
        
        
        if getDigit(number: Double(stringInt), digit: 3) == getDigit(number: Double(strNum), digit: 3) {
            strikeCount += 1
        } else if getDigit(number: Double(stringInt), digit: 3) == getDigit(number: Double(strNum), digit: 2) {
            ballCount += 1
        } else if getDigit(number: Double(stringInt), digit: 3) == getDigit(number: Double(strNum), digit: 1){
            ballCount += 1
        }
        if getDigit(number: Double(stringInt), digit: 2) == getDigit(number: Double(strNum), digit: 3) {
            ballCount += 1
        } else if getDigit(number: Double(stringInt), digit: 2) == getDigit(number: Double(strNum), digit: 2) {
            strikeCount += 1
        } else if getDigit(number: Double(stringInt), digit: 2) == getDigit(number: Double(strNum), digit: 1) {
            ballCount += 1
        }
        if getDigit(number: Double(stringInt), digit: 1) == getDigit(number: Double(strNum), digit: 3){
            ballCount += 1
        } else if getDigit(number: Double(stringInt), digit: 1) == getDigit(number: Double(strNum), digit: 2) {
            ballCount += 1
        } else if getDigit(number: Double(stringInt), digit: 1) == getDigit(number: Double(strNum), digit: 1){
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

// 텍스트 필드 델리게이트 이용하여, 숫자만 입력가능, 글자수 3개까지 제한
extension ViewController :UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
       
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
    return string.rangeOfCharacter(from: invalidCharacters) == nil && updatedText.count <= 3
    }
}


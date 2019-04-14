//
//  ViewController.swift
//  0412task
//
//  Created by brian은석 on 15/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    /***************************************************
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
     
     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
     
     < 힌트 >
     키워드 - willSelectRow, selectedRow, multipleSelection
     ***************************************************/
    
    override var description: String {
        return "Task 1 - MultipleSelection"
    }
    
    let tableView = UITableView()
    let maxRange = 50
    var data :[Int] = []
    var selectData :[Int] = []
    var deselectData :[Int] = []
    var maxCount = 20
    var saveData :[Int] = []
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
    }
    
    func setupTableView() {
        tableView.allowsMultipleSelection = true
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    @objc func reloadData() {
        for x in selectData {
            for y in deselectData {
                if x == y {
                    count += 1
                }
            }
            if count == 0 {
                saveData.append(x)
            }
            count = 0
        }
        print (saveData)
        
        
        data.removeAll()
        data.append(contentsOf: saveData)
        
        for _ in 1...(maxCount - saveData.count) {
            data.append(generateRandomNumber())
        }
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
        selectData.removeAll()
        saveData.removeAll()
        deselectData.removeAll()
    }
    
    func generateRandomNumber() -> Int {
        #if swift(>=4.2)
        let  randomNumber = (0..<maxCount + maxRange).randomElement()!
        #else
        let randomNumber = Int(arc4random_unifrom(UInt32(maxCount + maxRange)))
        #endif
        
        guard !data.contains(randomNumber) else { return generateRandomNumber()}
        return randomNumber
    }
    
    
}
// MARK: - UITableViewDataSource




extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
}


extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if data[indexPath.row] < 7 {
            return nil
        }
        else if !selectData.contains(data[indexPath.row]) {
            selectData.append(data[indexPath.row])
            print(selectData)
        }
        return indexPath
    }
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        deselectData.append(data[indexPath.row])
        print(deselectData)
        return indexPath
    }
}

//
//  WishListViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class WishListViewController: UIViewController {
    let wishTableView = UITableView()
    var saveData :[String] = []
    var sum = 0
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        wishTableView.dataSource = self
        makeTableView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        saveData = Singleton.shared.saveSingleTon.keys.sorted()
        print(saveData)
        wishTableView.reloadData()
        for x in 0...29 {
        sum += Singleton.shared.pizza[x].count * Singleton.shared.pizza[x].price
        }
        print(sum)
    }
    
    
    @IBAction func leftBarButton(_ sender: Any) {
        for x in (0...29) {
            Singleton.shared.pizza[x].count = 0
        }
        Singleton.shared.saveSingleTon = [:]
        saveData = []
        wishTableView.reloadData()
        sum = 0
    }
    @IBAction func rightBarButton(_ sender: Any) {
        let alertController = UIAlertController(
            title: "결제하기", message: "총 결제금액은\(sum)원 입니다" , preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "결제하기", style: .default) {
            _ in  for x in (0...29) {
                Singleton.shared.pizza[x].count = 0
            }
            Singleton.shared.saveSingleTon = [:]
            self.saveData = []
            self.wishTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
        
    }
    
    
    
  
    func makeTableView(){
        view.addSubview(wishTableView)
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        wishTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        wishTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        wishTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        wishTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        wishTableView.register(UITableViewCell.self, forCellReuseIdentifier: "c")
    }
}

extension WishListViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "c", for: indexPath)
        tableView.rowHeight = 120
          cell = UITableViewCell(style: .subtitle, reuseIdentifier: "c")
        cell.imageView?.image = UIImage(named: saveData[indexPath.row])
        cell.textLabel?.text = saveData[indexPath.row]
        
        cell.detailTextLabel?.text = "주문 수량 :\(Singleton.shared.saveSingleTon[saveData[indexPath.row]]!)개"
        return cell
    }
}

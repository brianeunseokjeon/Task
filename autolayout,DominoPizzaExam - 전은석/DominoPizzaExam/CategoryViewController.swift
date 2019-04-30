//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    let tableView = UITableView()
    let imageView = UIImageView()
    let categoryData = ["슈퍼시드" , "프리미엄", "클래식", "사이드디시", "음료", "피클소스"]
    override func viewDidLoad() {
        title = "Domino's"
      autolayout()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.tableHeaderView = imageView
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imageView.image = UIImage(named: "logo")
        
     
    }
    
    func autolayout() {
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
       
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    
    
    
    
}
extension CategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.customImageView.image = UIImage(named: categoryData[indexPath.row])
        return cell
    }
    
    
}
extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        navigationController?.pushViewController(productVC, animated: true)
        if indexPath.row == 0 {
        productVC.save = ["글램핑 바비큐","알로하 하와이안"]
            productVC.money = 10000
        } else if indexPath.row == 1 {
            productVC.save += ["블랙타이거 슈림프", "와규 앤 비스테카"]
            productVC.money = 10000

        } else if indexPath.row == 2 {
            productVC.save += ["베이컨체더치즈"]
            productVC.money = 10000

        } else if indexPath.row == 3 {
            productVC.save += ["딸기 슈크림"]
            productVC.money = 7000

        } else if indexPath.row == 4 {
            productVC.save += ["미닛메이드 스파클링 청포도"]
            productVC.money = 3000

        } else if indexPath.row == 5 {
            productVC.save += ["갈릭 디핑 소스"]
            productVC.money = 500

        }
    }
    
}

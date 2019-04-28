//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
    let tableView1 = UITableView()
    let imageView1 = UIImageView()
    let category = [["글램핑 바비큐","알로하 하와이안"],["블랙타이거 슈림프", "와규 앤 비스테카"],["베이컨체더치즈"],["딸기 슈크림"],["미닛메이드 스파클링 청포도"],["갈릭 디핑 소스"]]
    var save :[String] = []
    var money = 0
    override func viewDidLoad() {
        autolayout()
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
   
        
        
    }
    
    func autolayout() {
        tableView1.rowHeight = 120
        tableView1.dataSource = self
        tableView1.delegate = self
        
        view.addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    
    
    
    
}
extension ProductViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return save.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.imageView?.image = UIImage(named: save[indexPath.row])
        cell.textLabel?.text = "\(save[indexPath.row]), \(money)"
        return cell
    }
    
    
}
extension ProductViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
//        detailVC.lastImageView?.image = UIImage(named: "\(save[indexPath])")
        
    }
    
}

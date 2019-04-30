//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
   let productTableVeiw = UITableView()
    var saveData :[String] = []
    var savePrice = 0
    override func viewDidLoad() {
        view.backgroundColor = .white
        productTableVeiw.dataSource = self
        productTableVeiw.delegate = self
        makeTableView()
    }
    func makeTableView(){
        view.addSubview(productTableVeiw)
        productTableVeiw.translatesAutoresizingMaskIntoConstraints = false
        productTableVeiw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        productTableVeiw.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        productTableVeiw.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        productTableVeiw.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        productTableVeiw.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ProductViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return saveData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        tableView.rowHeight = 120
        cell.imageView?.image = UIImage(named: saveData[indexPath.row])
        cell.textLabel?.text = saveData[indexPath.row]
        cell.detailTextLabel?.text = "\(savePrice)"
       return cell
    }
}

extension ProductViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = DetailViewController()
        pushVC.detailData = saveData[indexPath.row]
        pushVC.navigationItem.title = saveData[indexPath.row]
        navigationController?.pushViewController(pushVC, animated: true)
          pushVC.view.backgroundColor = .white
      
    }
}

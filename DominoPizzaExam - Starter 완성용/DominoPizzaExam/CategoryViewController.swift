//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    @IBOutlet weak var categoriTableView: UITableView!
    let imageView = UIImageView()
  let data = Data()
    
    override func viewDidLoad() {
        title = "Domino's"
        categoriTableView.tableHeaderView = imageView
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        categoriTableView.dataSource = self
        categoriTableView.delegate = self
        
        categoriTableView.rowHeight = 100
        tableViewRegister()
    }
    
    func tableViewRegister(){
        categoriTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
}
extension CategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.pizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! CustomCell
       cell.FoodImageView.image = UIImage(named: data.pizza[indexPath.row].name)
        return cell
    }
    
    
}
extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductViewController()
        vc.saveData = data.category[indexPath.row]
        vc.savePrice = data.pizza[indexPath.row].price
        vc.navigationItem.title = data.pizza[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}

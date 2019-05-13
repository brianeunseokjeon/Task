//
//  WishListViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class WishListViewController: UIViewController {
    
    let tableView = UITableView()
    var arrSort: [String] = []
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Wish List"
        
        
        configure()
        autoLayout()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        arrSort = SingleTon.shared.wishListDict.keys.sorted()

    }
    
    func alertAction(tilte: String, message:String) {
    
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "wishCell")
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingleTon.shared.wishListDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reuseableCell = tableView.dequeueReusableCell(withIdentifier: "wishCell") {
            cell = reuseableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "wishCell")
        }
        cell.imageView?.image = UIImage(named: arrSort[indexPath.row])
        cell.textLabel?.text = "\(arrSort[indexPath.row])"
        cell.detailTextLabel?.text = "주문수량 :\(SingleTon.shared.wishListDict[arrSort[indexPath.row]]!)개"
        return cell
    }
}

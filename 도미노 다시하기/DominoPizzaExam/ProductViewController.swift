//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {

    var products: [Product] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        autoLayout()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        
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

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reuseableCell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            cell = reuseableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = "\(products[indexPath.row].price)원"
        cell.imageView?.image = UIImage(named: products[indexPath.row].name)
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let vc = DetailViewController()
        
        vc.countData = Product(name: products[indexPath.row].name, price: products[indexPath.row].price, count: products[indexPath.row].count)
    vc.imageView.image = UIImage(named: products[indexPath.row].name)
        navigationController?.pushViewController(vc, animated: true)
    }
}

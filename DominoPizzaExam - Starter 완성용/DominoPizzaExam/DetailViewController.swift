//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    let imageDetailView = UIImageView()
    var detailData = ""
    let contentView = UIView()
    let leftButton = UIButton()
    let rightButton = UIButton()
    let label = UILabel()

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        makeTableView()
    }
    func makeTableView(){
        view.addSubview(imageDetailView)
        imageDetailView.translatesAutoresizingMaskIntoConstraints = false
        imageDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        imageDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -230).isActive = true
        imageDetailView.image = UIImage(named: detailData)
        
        view.addSubview(contentView)
        contentView.backgroundColor = .gray
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: imageDetailView.bottomAnchor, constant: 50).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.addSubview(leftButton)
        leftButton.backgroundColor = .white
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        leftButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        leftButton.titleLabel?.text = "-"
        leftButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        
        contentView.addSubview(rightButton)
        rightButton.backgroundColor = .white
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        rightButton.titleLabel?.text = "+"
        rightButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        
        
        contentView.addSubview(label)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        for x in (0...29) {
            if detailData == Singleton.shared.pizza[x].name {
                label.text = "\(Singleton.shared.pizza[x].count)"
            }
        }
        label.textAlignment = .center
        label.textColor = .black
        
    }
    @objc func plus() {
        for x in (0...29) {
        if detailData == Singleton.shared.pizza[x].name {
        Singleton.shared.pizza[x].count += 1
        label.text = "\(Singleton.shared.pizza[x].count)"
            if Singleton.shared.saveSingleTon[detailData] == nil {
                Singleton.shared.saveSingleTon[detailData] = Singleton.shared.pizza[x].count
                print(Singleton.shared.saveSingleTon)
            } else {
                Singleton.shared.saveSingleTon[detailData] = Singleton.shared.pizza[x].count
                 print(Singleton.shared.saveSingleTon)

            }
            }
        }
    }
    @objc func minus() {
        for x in (0...29) {
        if detailData == Singleton.shared.pizza[x].name {
        guard Singleton.shared.pizza[x].count > 0 else { return }
        Singleton.shared.pizza[x].count -= 1
        
            Singleton.shared.saveSingleTon[detailData] = Singleton.shared.pizza[x].count
            print(Singleton.shared.saveSingleTon)
            label.text = "\(Singleton.shared.pizza[x].count)"
            }
        }
    }
}

//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 피드데이터를 보여줄 컨트롤러 입니다.
// 왼쪽 상단에 카메라 버튼이 있습니다.

class HomeViewController: UIViewController {
   
    let tableView = UITableView()
    var feedData = FeedSingleTon.shared.feedArray
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
        makeView()
        makeData()
        NotificationCenter.default.addObserver(self, selector: #selector(didtapButton(_:)), name: NSNotification.Name("comment"), object: nil)
    }
    
    func makeView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    func makeData() {
        for x in (1...4) {
            feedData.append(FeedData(userImage: "profile\(x)", mainImage: "feedImage\(x)"))
        }
    }
    @objc func didtapButton(_ sender:Notification) {
//        guard let cell = sender.userInfo!["cell"] as? UITableViewCell else { return }
        
        let vc = CommentViewController()
        show(vc, sender: true)
        vc.view.backgroundColor = .white
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.profileImageView.image = feedData[indexPath.row].userImage
        cell.nickNameLabel.text = "user\(indexPath.row + 1)"
        cell.feedImageView.image = feedData[indexPath.row].mainImage
    
        return cell
    }
    
}


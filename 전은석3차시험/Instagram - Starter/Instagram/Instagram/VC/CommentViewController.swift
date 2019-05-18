//
//  CommentViewController.swift
//  Instagram
//
//  Created by Wi on 23/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// HomeVC에서 보여주는 FeedData에서 댓글 버튼을 누르면 나올 컨트롤러입니다.
// 각각의 FeedData 에 각각의 댓글을 보여줍니다.
// 이모티콘 버튼은 선택사항입니다.

class CommentViewController: UIViewController{
    let tableView = UITableView()
    let customView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "comment")
        makeView()
        customView.textField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     becomeFirstResponder()
    }
    @objc func keyboardShow() {
          view.frame.origin.y = -210
 
    }
    
    @objc func keyboardHide() {
    
    }
    
    func makeView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100).isActive = true
        
        customView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }

}

extension CommentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Hi")
        view.endEditing(true)
        view.frame.origin.y = 0
        resignFirstResponder()
        return true
    }
}

extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! CommentTableViewCell
        
        
        return cell
    }
    
}


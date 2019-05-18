//
//  MyViewController.swift
//  Instagram
//
//  Created by Wi on 03/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


// 닉네임과 프로필 이미지를 변경하게 될 컨트롤러 입니다.
// 여기서 닉네임과 프로필 이미지를 변경한 다음 부터는 피드를 추가할때 등록된 닉네임과 프로필 이미지로 피드가 등록되어야 합니다.
// 닉네임 중복검사는 선택사항입니다. 
// 기본 값이 UITableViewController 입니다. 기본 뷰컨트롤러로 구현하고 싶으시면 타입을 UIViewController로 바꿔주세요.

class MyViewController: UITableViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    private let imagePickerController = UIImagePickerController()
var nickName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyViewTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        imagePickerController.delegate = self
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {return}

        let touchPoint = touch.location(in: tableView.cellForRow(at: IndexPath(row: 0, section: 0)))
        print(touchPoint)
        
        if ((tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MyViewTableViewCell).myProfileImageView.frame.contains(touchPoint)) {
            print(touchPoint)

            
            let alertController = UIAlertController(
                title: "이미지선택", message: nil, preferredStyle: .alert)

            let okAction1 = UIAlertAction(title: "카메라로 찍기", style: .default) {
                _ in print("카메라")

            }
            let okAction2 = UIAlertAction(title: "앨범에서 가져오기", style: .default) {
                _ in print("앨범")
                self.imagePickerController.sourceType = .photoLibrary
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)

            alertController.addAction(okAction1)
            alertController.addAction(okAction2)
                alertController.addAction(cancelAction)
                present(alertController, animated: true)
            }
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyViewTableViewCell
        cell.myProfileImageView.image = UIImage(named: "profile2")
        
        cell.nickNameTextField.addTarget(self, action: #selector(nick), for: .editingChanged)
        
        cell.changeProfileBtn.addTarget(self, action: #selector(nickChange), for: .touchUpInside)
        cell.selectionStyle = .none

        return cell
    }
    @objc func nick() {
        nickName = (tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MyViewTableViewCell).nickNameTextField.text!
    }
    
    
    
    @objc func nickChange() {
        
        if (tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MyViewTableViewCell).nickNameTextField.text! != "" {
            let alertController = UIAlertController(
            title: "닉네임 변경성공", message: "변경 닉네임:\(self.nickName)", preferredStyle: .actionSheet)
        
        let okAction1 = UIAlertAction(title: "OK", style: .default) {
            _ in print("ok")
            UserSingleTon.shared.userNickNames.append(self.nickName)
            
        }
       
        alertController.addAction(okAction1)
        present(alertController, animated: true)
        }
        
    }
}

    
    


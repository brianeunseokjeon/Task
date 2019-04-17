//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    var dataSet = [("iPhone8",1),("iPhoneSE_Gold",2),("iPhoneSE_RoseGold",3),("iPhoneX_SpaceGray",4),("iPhoneX_White",3),("iPhone8-1",2),("iPhoneSE_Gold-1",3),("iPhoneSE_RoseGold-1",2),("iPhoneX_SpaceGray-1",1),("iPhoneX_White-1",4),
    ("iPhone8-2",4),("iPhoneSE_Gold-2",2),("iPhoneSE_RoseGold-2",3),("iPhoneX_SpaceGray-2",4),("iPhoneX_White-2",4)]
    lazy var list: [information] = {
        var datalist: [information] = []
        
        for (x , y) in dataSet {
            let infor = information()
            infor.iamgeName = x
            infor.image = x
            infor.limit = y
        datalist.append(infor)
        }
        return datalist
    }()
    
    
    
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
    let realList = list[indexPath.row]
    
    cell.delegate = self
    
        cell.imageView1.image = UIImage(named: list[indexPath.row % 5].image! )
        cell.labelText.text = "\(realList.iamgeName!)"
        cell.labelNumber.text = "\(realList.imageNum)"
    
    
    cell.button.setImage(UIImage(named: "add"), for: .normal)
   
        return cell
    }
 
    
}

extension ViewController: ButtonDelegate {
    func itemCell(_ customCell: ItemCell, didTapButton button: UIButton) {
        if let indexPath = tableView.indexPath(for: customCell) {
            guard list[indexPath.row].imageNum >= list[indexPath.row].limit! else {
                  let addedNumber = list[indexPath.row].imageNum + 1
                  list[indexPath.row].imageNum = addedNumber
                  customCell.labelNumber.text = "\(addedNumber)"
             
                return
                }
            
        }
    }
    
    
}

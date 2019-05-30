//
//  BasicStoryboardViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class BasicStoryboardViewController: UIViewController {

  @IBOutlet private weak var collectionView: UICollectionView!
  
    let parkImages = ParkManager.imageNames(of: .nationalPark)
    
    
  
}

extension BasicStoryboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
        // custom 셀 만들지 않고 하는법
        if let imageView = cell.contentView.subviews.first as? UIImageView {
            // 그냥 인덱스패스.item하면 위에 *3했기때문에 오류 남... 셀은 더 많아서
            let imageName = parkImages[indexPath.item % parkImages.count]
            imageView.image = UIImage(named: imageName)
            cell.layer.cornerRadius = cell.frame.width / 2
        }
        
        return cell
    }
//    // 해더뷰 나옴..
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//    }
//    
    
}

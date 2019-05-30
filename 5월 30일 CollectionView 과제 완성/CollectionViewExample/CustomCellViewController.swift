//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class CustomCellViewController: UIViewController {
  
  var collectionView: UICollectionView!
  
  let numberArr = Array(1...120)
    let parkImages = ParkManager.imageNames(of: .nationalPark)
    var showImage = false
   var bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }

  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    // 밑에꺼 선택하면 오류남.. 정보들어가면 init에 밑에 함수는 없음
//    let collectionView = UICollectionView(frame: view.frame)
    collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    setupFlowLayout()
    
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    collectionView.register(
        CustomCell.self,
        forCellWithReuseIdentifier: CustomCell.identifier)
    collectionView.backgroundColor = .clear
    
    // 코드로 할 때는 배경은 검정색이
    collectionView.dataSource = self
    collectionView.delegate = self
    view.addSubview(collectionView)
  }
  
  private func setupFlowLayout() {
        //collectionView.collectionViewLayout 는 이것이지만 , UICollectionViewLayout
    //UICollectionViewLayout 이 UICollectionViewLayout 상속받는 자식클래스라 이걸로 ... 기능더 많음
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
    if showImage {
        //이미지
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 10 , left: 10, bottom: 10, right: 10)
    } else {
        //동그라미 원
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

  }
  
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(
        barButtonSystemItem: .refresh,
        target: self,
        action: #selector(changeCollectionViewItems(_:)))
    
    let changeDirection = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(changeCollectionViewDirection(_:)))
    navigationItem.rightBarButtonItems = [changeItem,changeDirection]
  }
  
  @objc private func changeCollectionViewItems(_ sender: Any) {
    showImage.toggle()
    setupFlowLayout()
    collectionView.reloadData()
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let current = layout.scrollDirection
    layout.scrollDirection = current == .horizontal ? .vertical : .horizontal
  }
  
}

// MARK: - UICollectionViewDataSource

extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return showImage ? parkImages.count * 2 : numberArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell!
    if showImage {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let item = indexPath.item % parkImages.count
        
        //여기서 이미지뷰 바로 접근못함.. 왜냐하면 프라이빗.. 프라이빗으로 한 이유는 커스템셀에 적어둠..
        
        customCell.configure(
            image: UIImage(named: parkImages[item]),
            title: parkImages[item]
        )
        cell = customCell
    } else {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
        
        cell.layer.cornerRadius = cell.frame.width / 2

    }
    
    cell.backgroundColor = getColor(at: indexPath)
    return cell
  }
    
    func  getColor(at indexPath: IndexPath) -> UIColor {
        let item = CGFloat(indexPath.item) // 0 ~ numberArr.count
        // 최소 0.1 ~ 최대 0.9 로만들고 싶을때, (최소) 0.1 + x * 0.8
        let maxCount = showImage ? parkImages.count * 2 : numberArr.count
        let factor = 0.1 + item / CGFloat(numberArr.count) * 0.8
        
        if showImage {
            return .init(hue: factor, saturation: 1, brightness: 1, alpha: 1)
        } else {
            return .init(hue: factor, saturation: factor, brightness: 1, alpha: 1)
        }
                        // ?            채도              명도
    }
}

// MARK: - UICollecgtionViewDelegateFlowLayout >> 그냥 델리게이트 셀프해야 됨..

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        if indexPath.item % 5 == 2 {
            return layout.itemSize.applying(CGAffineTransform(scaleX: 2, y: 2))
        } else {
            return layout.itemSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
// 애니메이션 효과
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            cell.alpha = 1
            cell.transform = .identity
        })
    }
}

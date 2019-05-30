//
//  FlexibleViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 30/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

//지금 하려는게 뭐냐면 itemsInLine 한 라인에 아이템 2개(밑에 설정) linesOnScreen 은 한 화면에 4개의 라인까지



final class FlexibleViewController: UIViewController {
    private enum UI {
        static let itemsInLine: CGFloat = 4
        static let linesOnScreen: CGFloat = 3
        static let itemSpacing: CGFloat = 10.0
        static let lineSpacing: CGFloat = 10.0
        static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        
        static let nextOffset: CGFloat = 40
    }
    
    
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame,
                                               collectionViewLayout: layout)
    var parkImages = ParkManager.imageNames(of: .nationalPark)
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationItem()
    }
    
    
  //SafeAreaInsets 가 viewdidLoad 에서 0,0,0,0 으로 정의되고, viewSafeAreaInsetsDidChange에서 SafeAreaInsets가 잡히기 시작함.
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setupFlowLayout()
    }
    
    // MARK: Setup CollectionView
    
    func setupCollectionView() {
        collectionView.register(
            CustomCell.self,
            forCellWithReuseIdentifier: CustomCell.identifier
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
    }
    
    // MARK: Setup FlowLayout
    
    func setupFlowLayout() {
        layout.minimumInteritemSpacing = UI.itemSpacing
        layout.minimumLineSpacing = UI.lineSpacing
        layout.sectionInset = UI.edgeInsets
       
        
        let topBottomSpacing = UI.lineSpacing * (UI.linesOnScreen - 1)
        
        let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
        let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
        let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom + view.safeAreaInsets.top + view.safeAreaInsets.bottom
        
        if layout.scrollDirection == .vertical {
            let horizontalSpacing = itemSpacing + horizontalInset
            let width =
                (collectionView.frame.width - horizontalSpacing) / UI.itemsInLine
            let rounded = width.rounded(.down)
            
            let verticalSpacing = verticalInset + topBottomSpacing
            
            let height = (collectionView.frame.height - verticalSpacing) / UI.linesOnScreen
            let rounded2 = height.rounded(.down)
            let padding = 40 / UI.itemsInLine
            layout.itemSize = CGSize(width: rounded, height: rounded2 - padding)
        } else {
            let verticalSpacing = itemSpacing + verticalInset
            let height = (collectionView.frame.height - verticalSpacing) / UI.itemsInLine
            let rounded = height.rounded(.down)
            
            let widthSpacing = topBottomSpacing + horizontalInset
            let width = (collectionView.frame.width - widthSpacing) / UI.linesOnScreen
            let rounded2 = width.rounded(.down)
            let padding = 40 / UI.linesOnScreen
            layout.itemSize = CGSize(width: rounded2 - padding, height: rounded)
        }
    }
    
    // MARK: Setup NavigationItem
    
    func setupNavigationItem() {
        let changeDirection = UIBarButtonItem(
            barButtonSystemItem: .reply,
            target: self,
            action: #selector(changeCollectionViewDirection(_:))
        )
        navigationItem.rightBarButtonItems = [changeDirection]
    }
    
    // MARK: - Action Handler
    
    @objc private func changeCollectionViewDirection(_ sender: Any) {
        layout.scrollDirection = layout.scrollDirection == .vertical ? .horizontal : .vertical
        setupFlowLayout()
    }
    
}

// MARK: - UICollectionViewDataSource

extension FlexibleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.identifier,
            for: indexPath
            ) as! CustomCell
        
        let item = indexPath.item % parkImages.count
        cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
        cell.backgroundColor = .black
        return cell
    }
}



// 1. linesOnScreen 속성 적용하기 .
// [도전과제]
// 1. nextOffset (위에 적혀있긴함) UI enum속에 있음. 다음화면의 높이값이 40만큼 보여줌.

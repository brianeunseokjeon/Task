//
//  TopCollectionViewCell.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    var topcollectionView :UICollectionView!
    var total = 3

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        backgroundColor = .red
    }
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        topcollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        topcollectionView.backgroundColor = #colorLiteral(red: 0.9411043525, green: 0.9412171841, blue: 0.9410660267, alpha: 1)
        layout.scrollDirection = .horizontal
        self.addSubview(topcollectionView)
        topcollectionView.translatesAutoresizingMaskIntoConstraints = false
        topcollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        topcollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        topcollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topcollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        topcollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        topcollectionView.dataSource = self
        topcollectionView.delegate = self
        topcollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "top")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


extension TopCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return total
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "top", for: indexPath)
        cell.backgroundColor = .blue
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
}


extension TopCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Metric.topEdgeInsets
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - Metric.topCellHorizontalPadding - Metric.itemSpacing - Metric.nextOffSet) / 2
        let height = collectionView.frame.height - Metric.topCellVerticalPadding

        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
    
    
    
    
}

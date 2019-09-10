//
//  GameCollectionViewCell.swift
//  Wiz
//
//  Created by brian은석 on 30/08/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    let titleLable = UILabel()
    let showingButton = UIButton()
    var gameListCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    func setupUI() {
        let padding: CGFloat = 10
        self.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 22).isActive = true
        titleLable.text = "추천 게임"
        titleLable.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        self.addSubview(showingButton)
        showingButton.translatesAutoresizingMaskIntoConstraints = false
        showingButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        showingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding).isActive = true
        showingButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
        showingButton.setTitle("더 보기", for: .normal)
        showingButton.setTitleColor(.black, for: .normal)
        showingButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        
        
        let layout = UICollectionViewFlowLayout()
        gameListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gameListCollectionView.backgroundColor = .white
        layout.scrollDirection = .vertical
        
        self.addSubview(gameListCollectionView)
        gameListCollectionView.translatesAutoresizingMaskIntoConstraints = false

        gameListCollectionView.topAnchor.constraint(equalTo: showingButton.bottomAnchor,constant: padding).isActive = true
        gameListCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gameListCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        gameListCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        gameListCollectionView.dataSource = self
        gameListCollectionView.delegate = self
        gameListCollectionView.register(GameCollectionViewCellofCell.self, forCellWithReuseIdentifier: "game")
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension GameCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "game", for: indexPath) as! GameCollectionViewCellofCell
        return cell
    }
    
    
}

extension GameCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Metric.gameEdgeInsets
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - Metric.gameCellHorizontalPadding) / 4
        let height = (collectionView.frame.height - Metric.gameCellVerticalPadding) / 2
        
        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
    
}

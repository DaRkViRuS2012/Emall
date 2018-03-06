//
//  HeaderCell.swift
//  E-MALL
//
//  Created by Nour  on 2/15/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class CategoriesSectionCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    let cellid = "CategoryCell"
    
    var categories:[Category] = []
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing  = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        return cv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadData(){
    
    
        categories.append(Category(image: "p1", name: "Shoes"))
        categories.append(Category(image: "p2", name: "Jeans"))
        categories.append(Category(image: "p3", name: "Watches"))
        categories.append(Category(image: "p4", name: "Glasess"))
        categories.append(Category(image: "p5", name: "Shoes"))
    }
    
    func setupView(){
        
        addSubview(collectionView)
        
        collectionView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        let nib = UINib(nibName: "CategorySectionCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: cellid)
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CategorySectionCell
        cell.category = categories[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(self.frame.width / 750)
        
        return CGSize(width: CGFloat(345 * ratio), height: self.height - 30 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            showViewController(category: categories[indexPath.item])
    }
    
    
    func showViewController(category:Category){
    
        let vc = CategoryViewController()

        vc.navigationItem.title  = category.name
        vc.navigationItem.titleLabel.textColor = .white
        (((self.window?.rootViewController as! AppNavigationDrawerController).rootViewController as! UITabBarController).selectedViewController as! AppNavigationController).pushViewController(vc, animated: true)
        
        
    }

}



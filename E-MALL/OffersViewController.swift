//
//  OffersViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/21/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material

class OffersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var categories:[Category]=[]
    
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing  = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = Color.grey.lighten5
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.navigationItem.title = "Offers"
        self.navigationItem.titleLabel.textColor = .white
        setupView()
        prepareCategory()
    }
    
    func prepareCategory(){
        categories.append(Category(image: "latestoffers", name: "Latest Offers"))
        categories.append(Category(image: "bestoffers", name: "Best offers"))
        categories.append(Category(image: "womenoffers", name: "WOMEN"))
        categories.append(Category(image: "c1", name: "BOTH"))
    }
    
    func setupView(){
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "Cellid")
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath) as! CategoryCell
        
        cell.category = categories[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(self.view.frame.width / 750)
        
        return CGSize(width: view.frame.width , height: CGFloat(495 * ratio))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openProduct(name: categories[indexPath.item].name)
    }
    
    
    func openProduct(name:String){
        let vc = SubCategoryViewController()
        vc.navigationItem.title = name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

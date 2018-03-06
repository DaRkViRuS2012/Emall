//
//  HeaderCell.swift
//  E-MALL
//
//  Created by Nour  on 2/15/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material


protocol SectionCellDelegate: class {
    func didLongPressCell(product:Product)
}


class SectionCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var section:Section?{
    
        didSet{
        
            guard let section = section else{
                return
            }
            //sectionTitle.text = section.title
            products = section.products
        }
    }
    
    
    weak var delegate:SectionCellDelegate?
    
  
    
    
    var products:[Product]=[]
    
    
    let sectionTitle:UILabel={
        let l = UILabel()
        l.text  = "Hot Products"
        l.font = UIFont.systemFont(ofSize: 14)
        return l
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing  = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = Color.grey.lighten5
        
        return cv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupView(){
      //  addSubview(sectionTitle)
        addSubview(collectionView)
    
     // _ = sectionTitle.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 5, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 25)
     _ =  collectionView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        collectionView.register(ProductsItemCell.self, forCellWithReuseIdentifier: "Cellid")
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath) as! ProductsItemCell
        
            cell.product = products[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(self.frame.width / 750)
        
        return CGSize(width: CGFloat(345 * ratio), height: CGFloat(495 * ratio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openProduct(product: products[indexPath.item])
    }
    
    
    func openProduct(product:Product){
//        let vc = ProductDetailsViewController()
//        vc.navigationItem.title = title
//        vc.navigationItem.titleLabel.textColor  = .white
//        
//        
//        (((self.window?.rootViewController as! AppNavigationDrawerController).rootViewController as! UITabBarController).selectedViewController as! AppNavigationController).pushViewController(vc, animated: true)
//        
        if let del = self.delegate {
            del.didLongPressCell(product:product)
        }
    }
    

}


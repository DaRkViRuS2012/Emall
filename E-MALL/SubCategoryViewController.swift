//
//  SubCategoryViewController.swift
//  E-MALL
//
//  Created by Nour  on 2/24/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material

class SubCategoryViewController: UIViewController  ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    fileprivate var menuButton: IconButton!
    fileprivate var FiltterButton: IconButton!
    
    var thumbView = true
    
    var products:[Product]=[]
    
    var ProductListItemCellId = "ProductListItemCellId"
    
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing  = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = Color.grey.lighten5
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        prepareMenuButton()
        prepareFiltterButton()
        prepareNavigationItem()
        setupView()
        prepareCategory()
    }
    
    
    func prepareFiltterButton(){
        FiltterButton = IconButton(image: UIImage(named :"filtter"))
        FiltterButton.image = FiltterButton.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
      
    }
    
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image:UIImage(named: "tailesView"))
        menuButton.setImage(UIImage(named: "tailesView"), for: .normal)
        menuButton.setImage(UIImage(named: "ThumView"), for: .selected)
        
        menuButton.image = menuButton.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
    }
    @objc
    fileprivate func handleSearchButton() {
        
        let vc = AppSearchBarController(rootViewController: SearchViewController())
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc
    fileprivate func handleMenuButton() {
        thumbView = !thumbView
        menuButton.isSelected = !menuButton.isSelected
        collectionView.reloadData()
    }
    
    
    fileprivate func prepareNavigationItem() {
        
        self.navigationItem.titleLabel.textColor = .white
        navigationItem.rightViews = [FiltterButton,menuButton]
    }
    
    
    func prepareCategory(){
        
        products.append(Product(image: "p1", name: "Product 1", owner: "addidas", price: 4500))
        products.append(Product(image: "p2", name: "Product 2", owner: "addidas", price: 4500))
        products.append(Product(image: "p3", name: "Product 3", owner: "addidas", price: 4500))
        products.append(Product(image: "p4", name: "Product 4", owner: "addidas", price: 4500))
        
        products.append(Product(image: "p1", name: "Product 1", owner: "addidas", price: 4500))
        products.append(Product(image: "p2", name: "Product 2", owner: "addidas", price: 4500))
        products.append(Product(image: "p3", name: "Product 3", owner: "addidas", price: 4500))
        products.append(Product(image: "p4", name: "Product 4", owner: "addidas", price: 4500))
        
    }
    
    func setupView(){
        
        self.navigationItem.titleLabel.textColor = .white
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        collectionView.register(ProductsItemCell.self, forCellWithReuseIdentifier: "Cellid")
        let nib = UINib(nibName: "ProductListItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ProductListItemCellId)
        
        self.navigationController?.navigationBar.backIndicatorImage = Icon.arrowBack
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Icon.arrowBack
        
        self.navigationController?.navigationBar.backIndicatorImage = self.navigationController?.navigationBar.backIndicatorImage?.withRenderingMode(.alwaysOriginal)
        
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(thumbView == true)
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath) as! ProductsItemCell
        
        cell.product = products[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListItemCellId , for: indexPath) as! ProductListItemCell
        cell.product = products[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(thumbView == true){
            let ratio = Double(self.view.frame.width / 750)
        
            return CGSize(width: view.frame.width / 2 - 10 , height: CGFloat(495 * ratio))
        }
        return CGSize(width: view.frame.width, height: 100)
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openProduct()
    }
    
    
  
    
    func openProduct(){
        
        let vc = ProductDetailsViewController()
        self.show(vc, sender: nil)
    }
    
    
}

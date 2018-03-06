//
//  HomeViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/20/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Localize_Swift
import Material

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,SectionCellDelegate,ProductsItemCellDelegate{

    fileprivate var menuButton: IconButton!
    fileprivate var FiltterButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
        var headerCellId   = "HeaderCellid"
        var sectionCellId  = "SectionCellid"
        var categoryCellId = "CategoryCell"
        var agencyCellId   = "AgencyCell"
    
        var sections:[Section] = []
    
    func didLongPressCell(product:Product) {
        print(product.name)
                let vc = ProductDetailsViewController()
                vc.navigationItem.title = product.name
                vc.navigationItem.titleLabel.textColor  = .white
            self.show(vc, sender: self)
    }
    
    func addtofavoriet(product: Product) {
        
    }
    
    func addtobasket(seller: String, product: Product) {
         Globals.basket.addProduct(seller: seller, product: product)
    }

    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing  = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        prepareSection()
        prepareMenuButton()
        prepareStarButton()
        prepareFiltterButton()
        prepareSearchButton()
        prepareNavigationItem()
        setupViews()
    }
    
    func prepareFiltterButton(){
        FiltterButton = IconButton(image: UIImage(named :"filtter"))
        FiltterButton.image = FiltterButton.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        FiltterButton.addTarget(self, action: #selector(openrightView), for: .touchUpInside)
    }
    
    func openrightView(){
    navigationDrawerController?.toggleRightView()
    }
    
    
    
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu)
        menuButton.image = menuButton.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
    }
    
    
    fileprivate func prepareStarButton() {
        starButton = IconButton(image: Icon.cm.star)
    }
    
    fileprivate func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search)
        searchButton.image = searchButton.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
    }
    
    
    @objc
    fileprivate func handleSearchButton() {
        
        let vc = AppSearchBarController(rootViewController: SearchViewController())
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }
    
    
    fileprivate func prepareNavigationItem() {
        
        self.navigationItem.title = "Syria-Mall"
        self.navigationItem.titleLabel.textColor = .white
        navigationItem.leftViews = [menuButton]
        navigationItem.rightViews = [FiltterButton,searchButton]
    }
    
    func setupViews(){
    
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: headerCellId)
        
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: sectionCellId)
        
        let nib = UINib(nibName: "SectionHeader", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.register(CategoriesSectionCell.self, forCellWithReuseIdentifier: categoryCellId)
        
        collectionView.register(AgenciesSectionCell.self, forCellWithReuseIdentifier: agencyCellId)
    }
    
    
    
    func prepareSection(){
        
        var products:[Product] = []
        
        products.append(Product(image: "p1", name: "Product 1", owner: "addidas", price: 4500))
        products.append(Product(image: "p2", name: "Product 2", owner: "addidas", price: 4500))
        products.append(Product(image: "p3", name: "Product 3", owner: "addidas", price: 4500))
        products.append(Product(image: "p4", name: "Product 4", owner: "addidas", price: 4500))
        products.append(Product(image: "p3", name: "Product 5", owner: "Puma", price: 4500))
        products.append(Product(image: "p4", name: "Product 6", owner: "diadora", price: 4500))
        products.append(Product(image: "p3", name: "Product 7", owner: "diadora", price: 4500))
        products.append(Product(image: "p4", name: "Product 8", owner: "Magilla", price: 4500))
        sections.append(Section(title: "Recently Viewed", products: products))
        sections.append(Section(title: "Categories", products: products))
        sections.append(Section(title: "Agencies", products: products))
        sections.append(Section(title: "Hot Products", products: products))
        sections.append(Section(title: "New Products", products: products))
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
            
            return cell
        
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId , for: indexPath) as! CategoriesSectionCell
            
            return cell
        
        }else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: agencyCellId, for: indexPath) as! AgenciesSectionCell
            
            return cell
        }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionCellId, for: indexPath) as! SectionCell
            cell.delegate = self
            cell.section = sections[indexPath.section - 1]
            return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 || indexPath.section == 2 || indexPath.section == 3{
            return CGSize(width: view.width, height: 150)
        }
        let ratio = Double(UIScreen.main.bounds.width / 750)
        return CGSize(width: view.width, height: CGFloat(575 * ratio))
    }
    
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:"Header", for: indexPath) as! SectionHeader
            if(indexPath.section > 0) {
                v.title.text = self.sections[indexPath.section - 1].title
            }
        return v
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section == 0){
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: self.view.width, height: 30)
    }
    
    
}

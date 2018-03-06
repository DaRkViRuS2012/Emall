
//
//  HomeViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/20/17.
//  Copyright © 2017 Nour . All rights reserved.
//dc2229  220 , 34  , 41

import UIKit
import Localize_Swift
import Material
import BTNavigationDropdownMenu
import YNDropDownMenu

class AgencyViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    fileprivate var menuButton: IconButton!
    fileprivate var FiltterButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    var headerCellId   = "HeaderCellid"
    var sectionCellId  = "SectionCellid"
    var categoryCellId = "CategoryCell"
    var agencyCellId   = "AgencyCell"
    
    var sections:[Section] = []
    var subCats:[String] = []
    
    
    var dropdown:YNDropDownMenu!
    
    let ZBdropDownViews = Bundle.main.loadNibNamed("DropDownViews", owner: nil, options: nil) as? [UIView]
    var vc:ZBFilterMemeView!
    var vc2:ZBFilterSalesPriceVIew!
    var vc3:ZBFilterDepositPriceView!
    
    func prin(){
        print(vc.tradeTypeSegmentControl.selectedSegmentIndex)
        
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
 
        // prepareNavDropDown()
        prepareSection()
        // prepareFiltter()
        //prepareMenuButton()
        //prepareStarButton()
        //prepareFiltterButton()
        //prepareSearchButton()
        prepareNavigationItem()
        setupViews()
    }
    
    func prepareNavDropDown(){
        let items:[String] = ["MEN", "WOMEN", "BABY"]
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: (self.navigationController?.view)!, title: items[0], items: items as [AnyObject])
        menuView.cellTextLabelColor = .white
        menuView.cellTextLabelAlignment = .center
        menuView.menuTitleColor = .white
        
        menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            // self.selectedCellLabel.text = items[indexPath]
            print(self?.menuButton.title ?? "")
        }
        
        self.navigationItem.centerViews = [menuView]
    }
    
    
    func prepareFiltter(){
        
        let ZBdropDownViews = Bundle.main.loadNibNamed("DropDownViews", owner: nil, options: nil) as? [UIView]
        vc = ZBdropDownViews?[0] as! ZBFilterMemeView
        vc2 = ZBdropDownViews?[1] as! ZBFilterSalesPriceVIew
        vc3 = ZBdropDownViews?[2] as! ZBFilterDepositPriceView
        
        let views:[UIView] = [vc2,vc,vc3]
        let FFA409 = UIColor(colorLiteralRed: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)
        
        
        // Inherit YNDropDownView if you want to hideMenu in your dropDownViews //CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 38)
        dropdown = YNDropDownMenu(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 38) , dropDownViews: views, dropDownViewTitles: ["Price", "Color", "Size"])
        
        
        dropdown.setImageWhen(normal: UIImage(named: "arrow_nor"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
        dropdown.setLabelColorWhen(normal: .black, selected: FFA409, disabled: .gray)
        dropdown.setLabelFontWhen(normal: .systemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 12), disabled: .systemFont(ofSize: 12))
        //            view.setLabel(font: .systemFont(ofSize: 12))
        
        dropdown.backgroundBlurEnabled = true
        //            view.bottomLine.backgroundColor = UIColor.black
        dropdown.bottomLine.isHidden = false
        // Add custom blurEffectView
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        dropdown.blurEffectView = backgroundView
        dropdown.blurEffectViewAlpha = 0.7
        
        // Open and Hide Menu
        dropdown.alwaysSelected(at: 0)
        //            view.disabledMenuAt(index: 2)
        //view.showAndHideMenuAt(index: 3)
        
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
        
        // self.navigationItem.title = "Syria-Mall"
        //  self.navigationItem.titleLabel.textColor = .white
        //  navigationItem.leftViews = [menuButton]
        // navigationItem.rightViews = [FiltterButton,searchButton]
    }
    
    func setupViews(){
        self.edgesForExtendedLayout = []
        
        view.addSubview(collectionView)
        // view.addSubview(dropdown)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: headerCellId)
        
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: sectionCellId)
        
        let nib = UINib(nibName: "SectionHeader", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: sectionCellId)
        
        collectionView.register(AgenciesSectionCell.self, forCellWithReuseIdentifier: agencyCellId)
        
        collectionView.register(subcategoryCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    
    
    func prepareSection(){
        
        var products:[Product] = []
        
        products.append(Product(image: "p1", name: "Product 1", owner: "addidas", price: 4500))
        products.append(Product(image: "p2", name: "Product 2", owner: "addidas", price: 4500))
        products.append(Product(image: "p3", name: "Product 3", owner: "addidas", price: 4500))
        products.append(Product(image: "p4", name: "Product 4", owner: "addidas", price: 4500))
        sections.append(Section(title: "Best Sellers Products", products: products))
        sections.append(Section(title: "Agencies", products: products))
        //  sections.append(Section(title: "Hot Product", products: products))
        // sections.append(Section(title: "New Collections", products: products))
        
        subCats.append("Women")
        subCats.append("Men")
        subCats.append("Kids")
        subCats.append("Girls")
        subCats.append("Glasses")
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section > sections.count){
            return subCats.count
        }
        return 1
    }
    
    //    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //
    //    }
    //
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
            
            return cell
            
        }
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionCellId , for: indexPath) as! SectionCell
            cell.section = sections[0]
            return cell
            
        }
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: agencyCellId, for: indexPath) as! AgenciesSectionCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! subcategoryCell
        cell.label.text = subCats[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(UIScreen.main.bounds.width / 750)
        if indexPath.section == 1{
            return CGSize(width: view.width, height: CGFloat(575 * ratio))
        }
        if indexPath.section < 3{
            return CGSize(width: view.width, height: 150)
        }
        
        return CGSize(width: view.width, height: CGFloat(100 * ratio))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:"Header", for: indexPath) as! SectionHeader
        if(indexPath.section > 0 && indexPath.section <= sections.count) {
            v.title.text = self.sections[indexPath.section - 1].title
        }
        return v
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if(section > 0 && section <= sections.count) {
            return CGSize(width: self.view.width, height: 30)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.section > sections.count){
            
            let vc = SubCategoryViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}






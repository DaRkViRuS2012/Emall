//
//  BasketViewController.swift
//  E-MALL
//
//  Created by Nour  on 3/1/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material
class BasketViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    var ratio = 0.5
    var basketCellid = "basketCellid"
    
    //var products:[Product] = []
    var sellers:[String] = []
    
    
    let totalLbl:UILabel={
        
        let l = UILabel()
        l.text = "Total: 14500 S.p"
        return l
        
    }()
    
    let bottomView:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let proceedBtn:UIButton = {
        
        let b = UIButton()
        b.setTitle("Proceed", for: .normal)
        b.backgroundColor = UIColor().mainColor()
        b.titleLabel?.textColor = .white
        b.layer.cornerRadius = 10
        
        return b
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        return cv
    }()
    
    
    
    
    var lodingView:LoadingView = {
        let v = LoadingView()
        return v
    }()
    
    var emptyView:EmptyView = {
        let v = EmptyView()
        return v
    }()
    
    var wrongView:ErrorView = {
        let v = ErrorView()
        return v
    }()
    
    
    func prepareViewState(){
        view.addSubview(lodingView)
        view.addSubview(wrongView)
        view.addSubview(emptyView)
        lodingView.frame  = CGRect(x: 0, y: 39, width: self.view.frame.width, height: self.view.frame.height - 40)
        wrongView.frame = CGRect(x: 0, y: 39, width: self.view.frame.width, height: self.view.frame.height - 40)
        emptyView.frame = CGRect(x: 0, y: 39, width: self.view.frame.width, height: self.view.frame.height - 40)
        emptyView.detailTextLabel.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        initilze()
    }
    
    func initilze(){
        
        lodingView.isHidden = true
        wrongView.isHidden = true
        emptyView.isHidden = true
    }
    
    func loding(){
        lodingView.isHidden = false
        wrongView.isHidden = true
        emptyView.isHidden = true
    }
    
    func error(){
        lodingView.isHidden = true
        wrongView.isHidden = false
        emptyView.isHidden = true
    }
    func empty(){
        
        lodingView.isHidden = true
        wrongView.isHidden = true
        emptyView.isHidden = false
    }
    

    
    
    override func viewDidLoad() {
        self.ratio = Double(UIScreen.main.bounds.width / 750)
        self.navigationItem.titleLabel.text = "My Bag"
        self.navigationItem.titleLabel.tintColor = .white
        self.navigationItem.titleLabel.textColor = .white
        
        setupViews()
        prepareData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupViews()
        prepareViewState()
        prepareData()
    }
    
    func injected() {
        
        print("I've been injected: \(self)")
    }
    
    
    
    func setupViews(){
        //collectionView.allowsSelection = false
        view.addSubview(collectionView)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(BasketCell.self, forCellWithReuseIdentifier: basketCellid)
        let nib = UINib(nibName: "SectionHeader", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        let nib2 = UINib(nibName: "footerCell", bundle: nil)
        collectionView.register(nib2, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
    }
    
    
    
    func prepareData(){
        //products = Basket.basket
        sellers = Globals.basket.sellerBasket.map({$0.key})
        collectionView.reloadData()
    }
    
    func loadData(){
        
    self.tabBarController?.selectedIndex = 0
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(sellers.count)
        print("dasda")
        if(sellers.count == 0){
            empty()
        }
        return sellers.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let seller = sellers[section]
        print((Globals.basket.sellerBasket[seller]?.products.count)!)
        return (Globals.basket.sellerBasket[seller]?.products.count)!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: basketCellid, for: indexPath) as! BasketCell
        let seller = sellers[indexPath.section]
        if let products = Globals.basket.sellerBasket[seller]?.products{
            cell.product  = products[indexPath.row]
            cell.deleteBtn.addTarget(self, action: #selector(handledelete), for: .touchUpInside)
        }
        return cell
    }
    
    
    
    func handledelete(_ sender : UIButton){
        let cell = sender.superview as! BasketCell
        let index = collectionView.indexPath(for: cell)
        cell.swipright()
        let seller = sellers[(index?.section)!]
        let product = (Globals.basket.sellerBasket[seller]?.products[(index?.row)!])!
        Globals.basket.sellerBasket[seller]?.products[(index?.item)!].count = 1
        Globals.basket.deleteProduct(seller: seller , product: product)
        prepareData()
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let seller = self.sellers[indexPath.section]
        switch kind {
        case UICollectionElementKindSectionHeader:
            let v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:"Header", for: indexPath) as! SectionHeader
            v.title.text = seller
            v.lineView.isHidden = false
            v.viewBtn.isHidden = true
            return v
        case UICollectionElementKindSectionFooter:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! footerCell
            view.priceLbl.text = "\((Globals.basket.sellerBasket[seller]?.total)!) S.p"
            view.deliveryLbl.text = "1500 S.p"
            return view
        default:
            return  UICollectionReusableView()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.width, height:  CGFloat(200 * ratio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
           return CGSize(width: view.width, height: 130)
    }
    
    
    
    //
    //    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //        let infoView = UIView()
    //        infoView.addSubview(proceedBtn)
    //        infoView.addSubview(totalLbl)
    //
    //
    //        _ = proceedBtn.anchor(nil, left: infoView.leftAnchor, bottom: infoView.bottomAnchor, right: infoView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16, widthConstant: 0, heightConstant: 50)
    //        _ = totalLbl.anchor(infoView.topAnchor, left: infoView.leftAnchor, bottom: proceedBtn.topAnchor, right: infoView.rightAnchor, topConstant: 0, leftConstant: 32, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    //
    //        let seller = sellers[section]
    //        totalLbl.text = "\(Globals.basket.sellerBasket[seller]?.total)"
    //        return infoView
    //    }
}

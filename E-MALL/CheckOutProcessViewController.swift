//
//  ViewController.swift
//  Audible
//
//  Created by Nour  on 12/7/16.
//  Copyright © 2016 Nour . All rights reserved.
//

import UIKit
import Localize_Swift

class CheckOutProcessViewController: UIViewController {
    
    
    
    var pagecontrollbottomanchor : NSLayoutConstraint?
    var SkipbtnTopanchor         : NSLayoutConstraint?
    var NextBtnTopanchor         : NSLayoutConstraint?
    
    
    
    var Slogontopanchor          : NSLayoutConstraint?
    var Nametopanchor            : NSLayoutConstraint?
    var getStartedtopanchor      : NSLayoutConstraint?
    var haveAccounttopanchor     : NSLayoutConstraint?
    var linetopanchor            : NSLayoutConstraint?
    var ratio = 0.5
    
    var colors:[UIColor] = []
    
    let pages:[Page] = {
        
        let FirstPage = Page(title: "WELCOME".localized(), message: "This is  the first page".localized(), image: "page1")
        let SecondPage = Page(title: "Second Page", message: "This is the second page", image: "page2")
        let ThirdPage = Page(title: "Third Page", message: "This is the Third page", image: "page3")
        
        return [FirstPage,SecondPage,ThirdPage]
    }()
    
    let basketCellId = "basketCellId"
    let pillingCellId = "pillingcell"
    let summaryCellId = "summarycell"
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing  = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        return cv
    }()
    
    
    
    lazy var pagecontroller:UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 1
        pc.numberOfPages = 3
        pc.pageIndicatorTintColor = UIColor(white: 0.2, alpha: 0.3)
        pc.currentPageIndicatorTintColor  = .black
        return pc
    }()
    
    
    lazy var SkipBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(UIColor().blue(), for: .normal)
        btn.addTarget(self, action: #selector(skip), for: .touchUpInside)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor().blue().cgColor
        return btn
    }()
    
    
    
    lazy var NextBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(UIColor.white , for: .normal)
        btn.backgroundColor = UIColor().blue()
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor().blue().cgColor
        
        return btn
    }()
    
    
    
    let lineView:UIView = {
        
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
        
    }()
    
    
    func skip(){
        
        pagecontroller.currentPage = pages.count - 1
        nextPage()
        
        
    }
    
    func nextPage(){
         let pagenumber = pagecontroller.currentPage
        if pagenumber < pages.count - 1  {
         
        let indexpath = IndexPath(item: pagecontroller.currentPage + 1, section: 0)
        
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        pagecontroller.currentPage += 1
     //   movetoNextPage()
        }
    }
    
    
    func prevPage(){
        let pagenumber = pagecontroller.currentPage
        if pagenumber > 0  {
            
            let indexpath = IndexPath(item: pagecontroller.currentPage - 1, section: 0)
            
            collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            pagecontroller.currentPage -= 1
            //   movetoNextPage()
        }
    }
    
    
    func movetoNextPage(){
        let pagenumber = pagecontroller.currentPage
        
        ratio = Double(UIScreen.main.bounds.width / 750)
        
        if pagenumber == pages.count {
            getin()
        } else
        {
            getout()
        }
    }
    
    
    
    
    func injected(){
        viewDidLoad()
        print("injected")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        colors = [ UIColor.white , UIColor.white  , UIColor.white ]
        addKeyboardobserver()
        prepareview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareview()
    }
    
    func prepareview(){
        
        self.navigationItem.title = "My Bag"
        self.navigationItem.titleLabel.textColor = .white
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(pagecontroller)
        view.addSubview(lineView)
        //view.addSubview(SkipBtn)
        //view.addSubview(NextBtn)
        
        _ = collectionView.anchor(pagecontroller.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: CGFloat(0 * ratio), rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
       // collectionView.register(BasketViewCell.self, forCellWithReuseIdentifier: basketCellId)
        collectionView.register(SummaryViewController.self, forCellWithReuseIdentifier: summaryCellId)
        collectionView.register(BillingInfoViewController.self, forCellWithReuseIdentifier: pillingCellId)
       // collectionView.register(StartView.self, forCellWithReuseIdentifier: logincellid)
        
        
        
        lineView.anchorToTop(collectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        pagecontrollbottomanchor = pagecontroller.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: CGFloat(0 * ratio), rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        
        
      //  SkipbtnTopanchor = SkipBtn.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: CGFloat(45 * ratio), bottomConstant: CGFloat(100 * ratio), rightConstant: CGFloat(385 *  ratio), widthConstant: 0, heightConstant: CGFloat(100 * ratio))[1]
        
        //NextBtnTopanchor = NextBtn.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: CGFloat(385 * ratio), bottomConstant: CGFloat(100 * ratio), rightConstant: CGFloat(45 * ratio), widthConstant: 0, heightConstant: CGFloat(100 * ratio))[1]
    }
    
   
    
    
    
    func getin(){
        
        //        pagecontrollbottomanchor?.constant = CGFloat(247 * ratio)
        //        SkipbtnTopanchor?.constant = CGFloat(100 * ratio)
        //        NextBtnTopanchor?.constant = CGFloat(100 * ratio)
        //        Slogontopanchor?.constant = CGFloat(550 * ratio)
        //        Nametopanchor?.constant = CGFloat(350 * ratio)
        //        getStartedtopanchor?.constant = CGFloat(1030 * ratio)
        //        haveAccounttopanchor?.constant = CGFloat(1180 * ratio)
        //        linetopanchor?.constant = CGFloat(470 * ratio)
        //
        //        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        //
        //            self.view.layoutIfNeeded()
        //
        //        }, completion:  nil)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func getout(){
        
        pagecontrollbottomanchor?.constant = -CGFloat(247 * ratio)
        SkipbtnTopanchor?.constant = -CGFloat(100 * ratio)
        NextBtnTopanchor?.constant = -CGFloat(100 * ratio)
        Slogontopanchor?.constant = CGFloat(350 * ratio)
        Nametopanchor?.constant = CGFloat(150 * ratio)
        getStartedtopanchor?.constant = CGFloat(830 * ratio)
        haveAccounttopanchor?.constant = CGFloat(1380 * ratio)
        linetopanchor?.constant = CGFloat(270 * ratio)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion:  nil)
        
    }
    
    
    
}



extension CheckOutProcessViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//       if indexPath.item == 0{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: basketCellId, for: indexPath) as! BasketViewCell
//            cell.proceedBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
//            return cell
//        }
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: summaryCellId, for: indexPath) as! SummaryViewController
            cell.proceedBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
            cell.backBtn.addTarget(self, action: #selector(prevPage), for: .touchUpInside)
            return cell
        }
        
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pillingCellId, for: indexPath) as! BillingInfoViewController
            cell.proceedBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
            cell.backBtn.addTarget(self, action: #selector(prevPage), for: .touchUpInside)
            return cell
        }
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: basketCellId, for: indexPath)
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("x \(targetContentOffset.pointee.x)")
        let pagenumber = Int(abs(targetContentOffset.pointee.x) / view.frame.width)
        pagecontroller.currentPage = pagenumber
//        movetoNextPage()
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func showLogin(){
        let vc = UINavigationController(rootViewController: LoginViewController())
        self.present(vc, animated: true, completion: nil)
    }
    
    func start(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension CheckOutProcessViewController:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}


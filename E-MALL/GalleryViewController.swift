//
//  GalleryViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/25/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    
    let gallery:[Gallery] = {
    let p1 = Gallery(image: "p1", name: "Brown Boots" , price: "$120")
    let p2 = Gallery(image: "p2", name: "Combat Boots", price: "$120")
    let p3 = Gallery(image: "p3", name: "Chukka Boots", price: "$120")
    let p4 = Gallery(image: "p4", name: "Chukka Boots", price: "$120")
    let p5 = Gallery(image: "p5", name: "Chukka Boots", price: "$120")
    let p6 = Gallery(image: "p6", name: "Chukka Boots", price: "$120")
    let p7 = Gallery(image: "p7", name: "Chukka Boots", price: "$120")
    let p8 = Gallery(image: "p8", name: "Chukka Boots", price: "$120")
    return [p1,p2,p3,p4,p5,p6,p7,p8]
    }()
    
    let gallerycellid = "gallerycell"
    
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        return cv
    }()
    
    
    let imageView:UIImageView = {
        let iv  = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    let triangle:UIImageView = {
    
        let image = UIImage(named: "T")
        let iv = UIImageView(image: image)
        return iv
        
    }()
    
    
    let lineView:UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    
    let galleryView:UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        return iv
    }()
    
    func injected() {
        setupViews()
        print("I've been injected: \(self)")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        
        setupViews()
    }
    
    
    func dismis() {
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    func addDeleteBtn(){
    
        let btnName = UIButton()
        
        btnName.setImage(UIImage(named: "Delete"), for: .normal)
        
        
        btnName.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnName.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        
    
    }


    var triangleleft  : NSLayoutConstraint?
    
    func setupViews(){
    view.backgroundColor = .white
    let ratio = Double(view.bounds.width / 750)
    addDeleteBtn()
    collectionView.register(galleryCell.self, forCellWithReuseIdentifier: gallerycellid)
    view.addSubview(imageView)
    view.addSubview(galleryView)
    galleryView.addSubview(collectionView)
    view.addSubview(lineView)
    view.addSubview(triangle)
    
    _ = galleryView.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: CGFloat(376 * ratio))
        
    _ = collectionView.anchor(galleryView.topAnchor, left: galleryView.leftAnchor, bottom: galleryView.bottomAnchor, right: galleryView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: galleryView.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    _ = lineView.anchor(nil, left: view.leftAnchor, bottom: galleryView.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
    
        let width = CGFloat(229 * ratio) / 2
        
        let const = CGFloat((width - 23) + 16)
        
        
        triangleleft = triangle.anchor(nil, left: view.leftAnchor, bottom: lineView.topAnchor, right: nil, topConstant: 0, leftConstant: const, bottomConstant: 0, rightConstant: 0, widthConstant: 47, heightConstant: 25)[0]
    }
    
    
    
    func triangelCenter(index:Int){
    
        let ratio = (view.bounds.width / 750)
        let width = CGFloat(229 * ratio) / 2
        let const =  CGFloat(index - 23) + width
    
        print("const \(const)")
    
        triangleleft?.constant = const
        
        UIView.animate(withDuration: 0.5) {
         self.view.layoutIfNeeded()
        }
    
    }
    
}

extension GalleryViewController: UICollectionViewDataSource,UICollectionViewDelegate{

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gallerycellid, for: indexPath) as! galleryCell
        let gal = gallery[indexPath.item]
        cell.gallery = gal
        return cell
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pagenumber = Int(targetContentOffset.pointee.x / galleryView.frame.width)
        let index = pagenumber * 3
        if (index < gallery.count)
        {
        let image = gallery[index].image
        imageView.image = UIImage(named: image)
        triangelCenter(index: 16)
        }

        for cell in collectionView.visibleCells  as [UICollectionViewCell]    {
            let ind = collectionView.indexPath(for: cell as UICollectionViewCell)
            print(ind!.item)
        }
        
        print("target x \(targetContentOffset.pointee.x)")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let attrib = collectionView.layoutAttributesForItem(at: indexPath)
        let  cellRect = attrib?.frame
        let cellframeInSuperView = collectionView.convert(cellRect!, to: collectionView.superview)
        
        let x = cellframeInSuperView.origin.x
        triangelCenter(index: Int(x))
        
        let image = gallery[indexPath.item].image
        imageView.image = UIImage(named: image)
    }

}

extension GalleryViewController:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(view.bounds.width / 750)
        
        let width = CGFloat(229 * ratio)
        let height = CGFloat(320 * ratio)
        return CGSize(width: width , height: height)
    }
    
}


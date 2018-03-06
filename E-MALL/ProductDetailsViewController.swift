//
//  ProductDetailsViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/21/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material

class ProductDetailsViewController: UIViewController {
    let imageView:UIImageView = {
        let iv  = UIImageView(image: UIImage(named: "product"))
        iv.contentMode = .scaleAspectFit
        return iv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViews()
    }
    
    
    func addCloseButton(){
    
    
        let btnName = UIButton()
        
        btnName.setImage(Icon.cm.clear, for: .normal)
        
        btnName.imageView?.image = btnName.imageView?.image?.withRenderingMode(.alwaysTemplate)
        btnName.tintColor = .white
        btnName.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnName.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        
        //.... Set Right/Left Bar Button item
        let leftButton = UIBarButtonItem()
        leftButton.customView = btnName
        self.navigationItem.leftBarButtonItem = leftButton
        
        
    }
    
    func setupViews(){
        
        
      
        
        let basketBtn = UIButton()
        
        basketBtn.setImage(UIImage(named: "basket"), for: .normal)
        
        
        basketBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       // basketBtn.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = basketBtn
        self.navigationItem.rightBarButtonItem = rightBarButton

        
        
        self.view.addSubview(imageView)
        
        
        imageView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
    }
    
    func dismis(){
    self.dismiss(animated: true, completion: nil)
    }
}

//
//  ProductsViewController.swift
//  E-MALL
//
//  Created by Nour  on 1/21/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material
class ProductsViewController: UIViewController {

    let imageView:UIImageView = {
        
        let iv  = UIImageView(image: UIImage(named: "products"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViews()
    }
    
    
    func setupViews(){
        
        self.navigationItem.title = "Men"
        self.navigationItem.titleLabel.textColor = .white
        
        self.navigationController?.navigationBar.backIndicatorImage = Icon.arrowBack
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Icon.arrowBack
        
        self.navigationController?.navigationBar.backIndicatorImage = self.navigationController?.navigationBar.backIndicatorImage?.withRenderingMode(.alwaysOriginal)
        
        
        self.view.addSubview(imageView)
        
        
        imageView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        imageView.isUserInteractionEnabled = true
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProduct)))
        
    }
    
    func openProduct(){

        
        let vc = UINavigationController(rootViewController: ProductDetailsViewController())
        self.present(vc, animated: true, completion: nil)
    
    }


}

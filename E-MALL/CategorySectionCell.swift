//
//  CategorySectionCell.swift
//  E-MALL
//
//  Created by Nour  on 4/8/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class CategorySectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    
    var category:Category?{
    
        didSet{
            
            guard let category = category else{
            return
            }
            
            imageView.image = UIImage(named: category.image)
            title.text = category.name
            
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    
    }

}

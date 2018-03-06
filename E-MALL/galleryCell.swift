//
//  galleryCell.swift
//  E-MALL
//
//  Created by Nour  on 1/25/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class galleryCell: UICollectionViewCell {
    
    
    var gallery:Gallery?{
    
        didSet{
            guard let gallery = gallery else {
                return
            }
        
            
            imageView.image = UIImage(named: "\(gallery.image)")
            
            
            
            let color  = UIColor(white: 0.2, alpha: 1)
            
            let attributedtext = NSMutableAttributedString(string: gallery.name, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
                ,NSForegroundColorAttributeName:color])
            
    
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            
            let length = attributedtext.string.characters.count
            
            attributedtext.addAttributes([NSParagraphStyleAttributeName : paragraph], range: NSRange(location:0,length:length))
            
            nameLbl.attributedText = attributedtext
            
            let attributedtext2 = NSMutableAttributedString(string: gallery.price, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12, weight: UIFontWeightMedium)
                ,NSForegroundColorAttributeName:color])
            
            
            let paragraph2 = NSMutableParagraphStyle()
            paragraph2.alignment = .center
            
            let length2 = attributedtext2.string.characters.count
            
            attributedtext2.addAttributes([NSParagraphStyleAttributeName : paragraph2], range: NSRange(location:0,length:length2))
            priceLbl.attributedText = attributedtext2

        }
    
    }
    
    
    let imageView:UIImageView = {
    
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        iv.backgroundColor = .black
        return iv
    }()
    
    let nameLbl:UILabel = {
    
        let l = UILabel()
        
        return l
    }()
    
    let priceLbl:UILabel = {
    
        let l = UILabel()
        return l
    }()
    
    let view:UIView = {
    
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    func setupViews(){
        
    self.layer.borderColor = UIColor(white: 0.8, alpha: 0.7).cgColor
    self.layer.borderWidth = 0.5
        
    addSubview(imageView)
    addSubview(view)
    view.addSubview(nameLbl)
    view.addSubview(priceLbl)
        
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        
        view.anchorToTop(imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
      _ = nameLbl.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        nameLbl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        
       _ = priceLbl.anchor(nameLbl.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

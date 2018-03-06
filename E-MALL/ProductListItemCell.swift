//
//  ProductListItemCell.swift
//  E-MALL
//
//  Created by Nour  on 4/11/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class ProductListItemCell: UICollectionViewCell {

  
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var sellerLbl: UILabel!
    
    
    
    var product:Product?{
    
        didSet{
        
            guard let product = product else {
                return
            }
            
            imageView.image = UIImage(named: product.image)
            nameLbl.text = product.name
            priceLbl.text = "\(product.price)"
            sellerLbl.text = product.owner
        }
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    
    @IBAction func handleFavoriete(_ sender: UIButton) {
        let selected = sender.isSelected
        sender.isSelected = !selected
        
    }
    
    
    @IBAction func addtoCart(_ sender: UIButton) {
        
        if(sender.isSelected == true){
            sender.isSelected = false
        }else{
            Globals.basket.addProduct(seller: (product?.owner)!, product: product!)
            sender.isSelected = true
        }
    }
    
    

}

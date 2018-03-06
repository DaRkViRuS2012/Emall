//
//  AgenciesSectionCell.swift
//  E-MALL
//
//  Created by Nour  on 4/8/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class AgencySectionCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var agency:Agency?{
    
        didSet{
        
            guard let agency = agency else{
                return
            }
            imageView.image = UIImage(named: agency.image)
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 15
        
        
    }

}

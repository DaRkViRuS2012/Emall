//
//  SummaryViewController.swift
//  E-MALL
//
//  Created by Nour  on 4/1/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class SummaryViewController: UICollectionViewCell {

    var label:UILabel={
    
        let l = UILabel()
        l.text = "Here goes the summary"
        l.font = .systemFont(ofSize: 24)
        l.translatesAutoresizingMaskIntoConstraints  = false
        return l
    }()
    
    let proceedBtn:UIButton = {
        
        let b = UIButton()
        b.setTitle("Proceed", for: .normal)
        b.backgroundColor = UIColor().mainColor()
        b.titleLabel?.textColor = .white
        b.layer.cornerRadius = 10
        
        return b
    }()
    
    let backBtn:UIButton = {
        
        let b = UIButton()
        b.setTitle("Back", for: .normal)
        b.backgroundColor = UIColor().mainColor()
        b.titleLabel?.textColor = .white
        b.layer.cornerRadius = 10
        
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
     func setupView() {
        addSubview(label)
        addSubview(proceedBtn)
        addSubview(backBtn)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        _ = proceedBtn.anchor(nil, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16, widthConstant: 100, heightConstant: 50)
        
       _ = backBtn.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 0, widthConstant: 100 , heightConstant: 50)

    }

    


}

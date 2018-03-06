//
//  EmptyView.swift
//  Example
//
//  Created by Alexander Schuch on 29/08/14.
//  Copyright (c) 2014 Alexander Schuch. All rights reserved.
//

import UIKit
import Material
class EmptyView: BasicPlaceholderView,StatefulPlaceholderView {
	
    let textLabel = UILabel()
    let detailTextLabel = UIButton()
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = Color.white
        
       // self.addGestureRecognizer(tapGestureRecognizer)
        
        textLabel.text = "Your Cart is empty"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(textLabel)
        
        detailTextLabel.setTitle("Go Shopping", for: .normal)
       // let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.footnote)
      //  detailTextLabel.titleLabel?.font = UIFont(descriptor: fontDescriptor, size: 0)
        detailTextLabel.titleLabel?.textColor = UIColor.white
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel.backgroundColor = .green
        detailTextLabel.layer.cornerRadius = 10
        centerView.addSubview(detailTextLabel)
        
        let views = ["label": textLabel, "detailLabel": detailTextLabel]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[label]-|", options: .alignAllCenterY, metrics: nil, views: views)
        //let hConstraintsDetail = NSLayoutConstraint.constraints(withVisualFormat: "|[detailLabel]|", options: .alignAllCenterY, metrics: nil, views: views)
       _ = detailTextLabel.anchor(textLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-[detailLabel]-|", options: .alignAllCenterX, metrics: nil, views: views)
        
        centerView.addConstraints(hConstraints)
        //centerView.addConstraints(hConstraintsDetail)
        centerView.addConstraints(vConstraints)
    }
    
    
    func placeholderViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
	
}

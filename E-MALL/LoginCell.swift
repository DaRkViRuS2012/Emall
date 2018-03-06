//
//  LoginCell.swift
//  Audible
//
//  Created by Nour  on 12/11/16.
//  Copyright © 2016 Nour . All rights reserved.
//

import UIKit


class LoginCell: UICollectionViewCell{


    override init(frame: CGRect) {
        super.init(frame: frame)
      
        
        setupViews()
    }
    
    
    let logo:UIImageView = {
    
    let image = UIImage(named: "logo")
    let iv = UIImageView(image: image)
    return iv
    }()
    
    
    let emailTxt:LeftPaddedTextField = {
    
        let tv = LeftPaddedTextField()
        tv.placeholder = "Enter email"
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1
        tv.keyboardType = .emailAddress
        return tv
    }()
    
    let passTxt:LeftPaddedTextField = {
        
        let tv = LeftPaddedTextField()
        
        tv.placeholder = "Enter pass"
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1
        tv.isSecureTextEntry = true
        return tv
    }()
    
    
    let loginBtn:UIButton = {
    
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.orange
    
        return btn
    }()
    
    func setupViews(){
        
    addSubview(logo)
    addSubview(emailTxt)
    addSubview(passTxt)
    addSubview(loginBtn)
        
        
    _ = logo.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
   
        
    _ = emailTxt.anchor(logo.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    _ = passTxt.anchor(emailTxt.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
    _ = loginBtn.anchor(passTxt.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}



class LeftPaddedTextField:UITextField{


    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
       return CGRect(x:bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}



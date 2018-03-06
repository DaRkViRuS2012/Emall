//
//  RegisterView.swift
//  FastFood
//
//  Created by Nour  on 1/5/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit


class RegisterView: UIView {

    
    
    var ratio = 1.0
    var textFieldHeight = 75.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        ratio = Double(UIScreen.main.bounds.width / CGFloat(750))
        setupViews()
        
    }
    func injected() {
        setupViews()
        print("I've been injected: \(self)")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    let label:UILabel = {
        
      let lb = UILabel()
      lb.numberOfLines = 2
      lb.text = "CREATE NEW\n  ACCOUNT"
    return lb
    }()
    
    let UserNameTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
     //   tf.detailLabel.text = "This field can't be empty"
        tf.autocapitalizationType = .none
        tf.keyboardType = .default
        return tf
    }()
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
      //  tf.detailLabel.text = "Enter a vaild Email"
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    let mobileTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Mobile"
     //   tf.detailLabel.text = "Enter a vaild Mobile Number"
        tf.autocapitalizationType = .none
        tf.keyboardType = .numberPad
        return tf
    }()
    
    
    
    let passTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "PassWord"
    //    tf.detailLabel.text = "This field can't be empty"
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        return tf
    }()
    
    
    let confirmTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm"
    //    tf.detailLabel.text = "Password don't match"
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        return tf
    }()
    
    
    
    let signupBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Sign up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor().mainColor()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    let haveAccountlabel :UILabel = {
        
        let lb = UILabel()
        lb.text = "ALREADY HAVE AN ACCOUNT?"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 10)
        return lb
        
    }()
    
    let loginBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Log in", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = .clear
        btn.setTitleColor(UIColor().mainColor(), for: .normal)
        return btn
        
    }()
    
    
    func setupViews(){
        addSubview(label)
        addSubview(UserNameTextField)
        addSubview(emailTextField)
        addSubview(mobileTextField)
        addSubview(passTextField)
        addSubview(confirmTextField)
        addSubview(signupBtn)
        
        
         //leftConstant: CGFloat(292 * ratio),
            _ = label.anchor(topAnchor, left: nil , bottom: nil, right: nil, topConstant: CGFloat(ratio * 170) ,leftConstant: 0 , bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(250 * ratio), heightConstant: CGFloat(170 * ratio))
        
            label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
            _ = UserNameTextField.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(334 * ratio), leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(textFieldHeight * ratio))
        
            _ = emailTextField.anchor(UserNameTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(textFieldHeight * ratio))
        
            _ = mobileTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(textFieldHeight * ratio))
        
        
            _ = passTextField.anchor(mobileTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(textFieldHeight * ratio))
        
            _ = confirmTextField.anchor(passTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(textFieldHeight * ratio))
        
     
        
        
        
        _ = signupBtn.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(1032 * ratio), leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(100 * ratio))
        
      
    }
    

    
    

}

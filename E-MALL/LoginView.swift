//
//  LoginView.swift
//  FastFood
//
//  Created by Nour  on 1/3/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit


class LoginView: UIView {

    
    var ratio = 1.0
    
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
    
    
    let logo:UIImageView = {
        
        let iv = UIImageView(image: UIImage(named: "logo"))
        iv.contentMode = .scaleAspectFit
        return iv
        
    }()
    
    
    let emailLable:UILabel = {
        
        let lb = UILabel()
        lb.text  = "Email"
        return lb
    }()
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    let passLable:UILabel = {
        
        let lb = UILabel()
        lb.text  = "PassWord"
        return lb
    }()
    
    let passTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "PassWord"
     //   tf.placeholderActiveColor = .blue
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        return tf
    }()
    
    
    let forgetBtn:UIButton = {
    
        
        let btn = UIButton()
        btn.setTitle("Forget Password", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = .clear
        btn.setTitleColor(UIColor().mainColor(), for: .normal)
        return btn
    
    }()
    
    let loginBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor().mainColor()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    let label :UILabel = {
    
        let lb = UILabel()
        lb.text = "DON’T HAVE AN ACCOUNT?"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 10)
        return lb
        
    }()
    
    let signupBtn:UIButton = {
    
        let btn = UIButton()
        btn.setTitle("SIGN UP", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = .clear
        btn.setTitleColor(UIColor().mainColor(), for: .normal)
        return btn
        
    }()
    
    
    func setupViews(){
        addSubview(logo)
        addSubview(emailTextField)
        addSubview(passTextField)
        addSubview(forgetBtn)
        addSubview(loginBtn)
        addSubview(label)
        addSubview(signupBtn)
        
        
        _ = logo.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(ratio * 233)  , leftConstant: CGFloat(290 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(170.0 * ratio), heightConstant: CGFloat(170.0 * ratio))
        
        
      
        _ = emailTextField.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(500 * ratio), leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(100 * ratio))
        
        _ = passTextField.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(645 * ratio), leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(100 * ratio))
        
        _ = forgetBtn.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(772 * ratio), leftConstant: CGFloat(494 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(196 * ratio), heightConstant: CGFloat(26 * ratio))
        
        
        
        
        _ = loginBtn.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(840 * ratio), leftConstant: CGFloat(60 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(630 * ratio), heightConstant: CGFloat(100 * ratio))
        
        
        _ = label.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: CGFloat(1010 * ratio), leftConstant: CGFloat(170 * ratio), bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: CGFloat(20 * ratio))
        
        
        _ = signupBtn.anchor(topAnchor, left: label.rightAnchor, bottom: nil, right: nil, topConstant: CGFloat(1010 * ratio), leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: CGFloat(101 * ratio), heightConstant: CGFloat(20 * ratio))
        
    }
    
    


}

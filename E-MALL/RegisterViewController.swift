//
//  RegisterViewController.swift
//  FastFood
//
//  Created by Nour  on 1/5/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleLabel.text = "Register"
        view.backgroundColor = .white
        setupViews()
        addKeyboardobserver()
    }
    
    
    
    func injected() {
        setupViews()
        print("I've been injected: \(self)")
    }
    
    
    
    func setupViews(){
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.title = "Sign up"
        
        let registerView = RegisterView()
        
        registerView.loginBtn.addTarget(self, action: #selector(handelSignin), for: .touchUpInside)
        registerView.signupBtn.addTarget(self, action: #selector(handelSignup), for: .touchUpInside)
       
      //  self.view = registerView
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.hideKeyboard)))
        
        
    }
    
 
    
    func handelSignin(){
        print("Sign In ....")
        hideKeyboard()
        
        
    }
    
    func handelSignup(){
        print("Sign up ....")
        hideKeyboard()
        
    }
    
    



}

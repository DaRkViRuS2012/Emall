//
//  LoginViewController.swift
//  FastFood
//
//  Created by Nour  on 1/3/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material
class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var asd: NSLayoutConstraint!
    
    @IBOutlet weak var gsmTxt: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.titleLabel.text = "Sign in"
        navigationItem.titleLabel.tintColor = .white
        navigationItem.titleLabel.textColor  = .white
        self.extendedLayoutIncludesOpaqueBars = true
        setupViews()
        addKeyboardobserver()
    }

    
    @IBAction func handelNext(_ sender: FlatButton) {
        
        let gsm = gsmTxt.text?.trimmed
        if(gsm == "1"){
          self.performSegue(withIdentifier: "login2signup", sender: nil)
        }
        if(gsm == "2"){
            self.performSegue(withIdentifier: "login2password", sender: nil)
        }
        if(gsm == "3"){
        
            self.performSegue(withIdentifier: "login2verification", sender: nil)
        }
      
    }
    

}


extension LoginViewController{
    
    func dismis() {
        
        //let presentingViewController = self.presentingViewController
        self.dismiss(animated: false, completion: {
            self.ShowHomeViewController()
        })
        
    }
    
    func dismisss(){
        
        let presentingViewController = self.presentingViewController
        self.dismiss(animated: false, completion: {
            presentingViewController!.dismiss(animated: true, completion: {})
        })
    }
    
    func ShowHomeViewController(){
        
        let loginController = AppNavigationController(rootViewController: HomeController())
        
        present(loginController, animated: true, completion: nil)
        
    }
    
    func setupViews(){
        
        let btnName = UIButton()
        
        btnName.setImage(Icon.cm.close, for: .normal)
        
        btnName.imageView?.image = btnName.imageView?.image?.withRenderingMode(.alwaysTemplate)
        btnName.tintColor = .white
        btnName.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnName.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        
        
        self.title = "Sign in"
        let loginview = LoginView()
        
        loginview.loginBtn.addTarget (self, action: #selector(handelSignin), for: .touchUpInside)
        loginview.signupBtn.addTarget(self, action: #selector(handelSignup), for: .touchUpInside)
        loginview.forgetBtn.addTarget(self, action: #selector(handelforget), for: .touchUpInside)
        
        //  self.view = loginview
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.hideKeyboard)))
        self.addKeyboardobserver()
        
    }
    
    func handelSignin(){
        print("Sign In ....")
        hideKeyboard()
        dismisss()
    }
    
    func handelSignup(){
        print("Sign up ....")
        hideKeyboard()
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func handelforget(){
        print("forget ....")
        hideKeyboard()
        
        
    }


}



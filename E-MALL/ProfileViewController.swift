//
//  ProfileViewController.swift
//  E-MALL
//
//  Created by Nour  on 3/14/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material
class ProfileViewController: UIViewController {
    
    
    //var imageView:UIImageView()
    var nameLbl:UILabel={
    
        let l = UILabel()
        l.text = "Nour Araar"
        l.textColor = .white
        return l
    }()
    var signoutBtn:FlatButton={
        
        let fb = FlatButton()
        fb.setTitle("Sign out", for: .normal)
        fb.backgroundColor = Color.blue.base
        fb.layer.cornerRadius = 10
        return fb
    
    }()
    var contentView:UIView={
    
        let v = UIView()
        
        return v
    
    }()
    var emailLbl:UILabel={
        let l = UILabel()
        l.text = "nour_araar_2009@yahoo.com"
        
        l.textColor = .white
        return l
    }()
    var changePasswordBtn:FlatButton={
        let fb = FlatButton()
        fb.setTitle("Change Password", for: .normal)
        fb.backgroundColor = Color.green.base
        fb.layer.cornerRadius = 10
        
        return fb
    
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }
    

    
    
    
    func changepass(){
    
        
    }
    
    
    func load(){
        
        self.view.addSubview(contentView)
        contentView.addSubview(nameLbl)
        contentView.addSubview(emailLbl)
        contentView.addSubview(changePasswordBtn)
        contentView.addSubview(signoutBtn)
        
   
        
        
        let ratio = self.view.frame.width / 750
    
        
        let emailleft:CGFloat = CGFloat(87 * ratio)
        let emailtop:CGFloat = CGFloat(472 * ratio)
        let emailWidth:CGFloat = CGFloat(576 * ratio)
        let emailHeight:CGFloat = CGFloat(100 * ratio)
        
        
        let changeleft:CGFloat = CGFloat(87 * ratio)
        let changetop:CGFloat = CGFloat(750 * ratio)
        let changeWidth:CGFloat = CGFloat(576 * ratio)
        let changeHeight:CGFloat = CGFloat(100 * ratio)
        
        
        
        let loginleft:CGFloat = CGFloat(87 * ratio)
        let logintop:CGFloat = CGFloat(900 * ratio)
        let loginWidth:CGFloat = CGFloat(576 * ratio)
        let loginHeight:CGFloat = CGFloat(100 * ratio)
        

        //   view.backgroundColor = MaterialColor.blue.base
        
        contentView.backgroundColor = Color.darkText.primary
        
        contentView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        _ = nameLbl.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: emailtop, leftConstant: emailleft, bottomConstant: 0, rightConstant: 0, widthConstant: emailWidth, heightConstant: emailHeight)
        
        _ = emailLbl.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: emailtop + 50, leftConstant: emailleft, bottomConstant: 0, rightConstant: 0, widthConstant: emailWidth, heightConstant: emailHeight)
        _ = signoutBtn.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: logintop, leftConstant: loginleft, bottomConstant: 0, rightConstant: 0, widthConstant: loginWidth, heightConstant: loginHeight)
        _ = changePasswordBtn.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: changetop, leftConstant: changeleft, bottomConstant: 0, rightConstant: 0, widthConstant: changeWidth, heightConstant: changeHeight)
        
    
        
    }
    
    

    
    
    func signout(){

    }
    
  

}

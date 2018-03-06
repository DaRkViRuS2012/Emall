//
//  UIViewController.swift
//  E-MALL
//
//  Created by Nour  on 4/4/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit


extension UIViewController{
    
    
    func endEdit() {
        view.endEditing(true)
        print("sadasd")
    }
    
    
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    
    func addKeyboardobserver(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    
    func keyboardHidden(){
        
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    
    
    func keyboardShown(notification:NSNotification){
        
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        print(keyboardHeight)
        
        
        view.frame = CGRect(x: 0, y: -100, width: view.frame.width, height: view.frame.height)
        
    }
    
    
    
    
}

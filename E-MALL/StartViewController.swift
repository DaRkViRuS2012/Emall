//
//  StartViewController.swift
//  DemoExpandingCollection
//
//  Created by Nour  on 7/1/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        self.load()
        

     
    }
    
    
    
    func load()
    {
        
       configureNavigationTabBar()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "start.jpg")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
       
        let startView = StartView()
        self.view = startView
        
        startView.haveAccountBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        startView.getStartedBtn.addTarget(self, action: #selector(mainpage), for: .touchUpInside)
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        
    }
    
       

    
    
    func login()
    {
//        LoginViewController.isfromMain = false
//        self.performSegue(withIdentifier: "loginSegue", sender: nil)
//        
    }
    
    func mainpage()
    {
        
//        self.performSegueWithIdentifier("mainSegue", sender: nil)
    }
    
    
    private func configureNavigationTabBar() {
        //transparent background
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage     = UIImage()
        UINavigationBar.appearance().isTranslucent     = true
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 2)
        shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSShadowAttributeName: shadow
        ]
    }
    
    
    
    
}

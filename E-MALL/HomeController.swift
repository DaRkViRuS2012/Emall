//
//  HomeController.swift
//  E-MALL
//
//  Created by Nour  on 1/20/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit
import Material

class HomeController:UITabBarController{
    
    
    fileprivate var menuButton: IconButton!
    fileprivate var FiltterButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    
    let tabViewController1 = AppNavigationController(rootViewController: HomeViewController())
    let tabViewController3 = AppNavigationController(rootViewController: OffersViewController())
    let tabViewController4 = AppNavigationController(rootViewController: BasketViewController())
    let tabViewController5 = AppNavigationController(rootViewController: GalleryViewController())
    
    
    public var basketCount =  0 {
    
        didSet{
        
        
            if basketCount != 0 {
            
            tabViewController4.tabBarItem.badgeValue = "\(basketCount)"
            
            }else{
            
                tabViewController4.tabBarItem.badgeValue = ""
            }
        
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "E-Mall"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.edgesForExtendedLayout = []
        prepareView()
   
    }
    
    
    

    func ShowViewController(){
        
        
        let loginController = WizardViewController()
        
        present(loginController, animated: true, completion: nil)
        //show(loginController, sender: nil)
        
    }
    
    func prepareView(){
        if isLogedin() == false{
        perform(#selector(ShowViewController), with: nil, afterDelay: 0.01)
        
        }
      
// 
//        let tabViewController1 = AppNavigationController(rootViewController: HomeViewController())
//      //  let tabViewController2 = AppNavigationController(rootViewController: MainCategoryViewController())
//        let tabViewController3 = AppNavigationController(rootViewController: OffersViewController())
//        let tabViewController4 = AppNavigationController(rootViewController: BasketViewController())
      //  let tabViewController5 = AppNavigationController(rootViewController: GalleryViewController())
        let controllers = [tabViewController1,tabViewController3,tabViewController4,tabViewController5]
        self.viewControllers = controllers
        self.hidesBottomBarWhenPushed = false
        
        
        
        tabViewController1.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "FEED"),
            tag: 1)
//        tabViewController2.tabBarItem = UITabBarItem(
//            title: "Categories",
//            image: UIImage(named: "cat"),
//            tag: 1)
        tabViewController3.tabBarItem = UITabBarItem(
            title: "Offers",
            image:UIImage(named: "discount") ,
            tag:2)
        tabViewController4.tabBarItem = UITabBarItem(
            title: "Basket",
            image:UIImage(named: "cart24") ,
            tag:2)
        tabViewController5.tabBarItem = UITabBarItem(
            title: "More",
            image:UIImage(named: "more") ,
            tag:2)
        
    }
    
    
    func isLogedin()->Bool{
        
        return false
    }
    
    
}


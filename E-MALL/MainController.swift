//
//  HomeController.swift
//  Audible
//
//  Created by Nour  on 12/11/16.
//  Copyright © 2016 Nour . All rights reserved.
//

import UIKit

class MainController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

//        let homeController = HomeController()
  //      self.viewControllers = [homeController]
  
        if islogedin() == false {
            
            perform(#selector(ShowViewController), with: nil, afterDelay: 0.01)
        }else
        {
            perform(#selector(ShowHomeViewController), with: nil, afterDelay: 0.01)
        
        }
        
        
    }
    
    
    func ShowViewController(){
    
    let loginController = WizardViewController()
    
    present(loginController, animated: true, completion: nil)
    
    }

    func ShowHomeViewController(){
        
        let loginController = AppNavigationController(rootViewController: HomeController())
        
        present(loginController, animated: true, completion: nil)
        
    }
    
    func islogedin() ->Bool{
    
    return false
    }
    


}




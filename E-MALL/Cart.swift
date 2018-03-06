//
//  Cart.swift
//  E-MALL
//
//  Created by Nour  on 4/21/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import Foundation

class Cart{


    var sellerBasket:[String:Basket]

    init() {
        sellerBasket  = [String:Basket]()
    }
    
    func addProduct(seller:String,product:Product){
    
        if sellerBasket[seller] == nil{
            sellerBasket[seller] = Basket()
        }
        sellerBasket[seller]?.add(product: product)
    }
    
    
    func deleteProduct(seller:String,product:Product)  {
        if sellerBasket[seller] != nil{
            sellerBasket[seller]?.delete(product: product)
            if sellerBasket[seller]?.products.count == 0 {
                sellerBasket.removeValue(forKey: seller)
            }
        }
        
    }
}

//
//  Product.swift
//  E-MALL
//
//  Created by Nour  on 2/22/17.
//  Copyright © 2017 Nour . All rights reserved.
//

import UIKit

class Product{

    var image : String
    var name  : String
    var owner : String
    var price : Double
    var count : Int
    init(image:String,name:String,owner:String,price:Double,count:Int = 1) {
        self.image = image
        self.name  = name
        self.owner = owner
        self.price = price
        self.count = count
    }

}

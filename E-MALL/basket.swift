
import UIKit

class Basket{
    
    
    var products:[Product]
    var total:Double
    
    init() {
        products = [Product]()
        total = 0.0
    }
    
    
    func add(product:Product){
        if let index = findProduct(product: product){
            products[index].count += 1
        }else{
            products.append(product)
//            ((UIWindow().rootViewController as! AppNavigationDrawerController).rootViewController as! UITabBarController).viewControllers?[2].tabBarItem.badgeValue = "\(products.count)"
            
            
        }
        total += product.price
    }
    
    
    public func findProduct(product:Product)->Int?{
        
        for i in 0..<products.count{
            if products[i].name == product.name{
                return i
            }
        }
        return nil
    }
    
    func delete(product:Product){
        if let index = findProduct(product: product){
            if product.count == 1 {
                products.remove(at: index)
            }else{
                product.count -= 1
            }
            total -= product.price
        }
    }
    
}

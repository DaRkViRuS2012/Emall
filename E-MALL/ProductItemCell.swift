

import UIKit
import Material



protocol ProductsItemCellDelegate: class {
    func addtobasket(seller:String,product:Product)
    func addtofavoriet(product:Product)
}


class ProductsItemCell:UICollectionViewCell{

    var delegate:ProductsItemCellDelegate?
    
    var product:Product?{
        didSet{
            guard let product = product else{
                return
            }
            
            imageView.image = UIImage(named: product.image)
            name.text = product.name
            seller.text = product.owner
            price.text = "\(product.price)"
        }
    }
    
    var imageView:UIImageView={
        let image = UIImage(named: "p8")
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        return iv
    }()
    
    
    let name:UILabel={
        let l = UILabel()
        l.text = "Brown Boots"
        return l
    }()
    
    let seller:UILabel={
        
        let l = UILabel()
        l.text = "addidas"
        l.font = UIFont.systemFont(ofSize: 10)
        l.textColor = UIColor.lightGray
        return l
        
    }()
    let price:UILabel={
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 10)
        l.layer.cornerRadius = 10
        l.layer.borderColor = UIColor(white: 0.4, alpha: 0.5).cgColor
        l.layer.borderWidth = 1
        l.text = "$50"
        l.textAlignment = .center
        return l
    }()
    
    let FavoriteBtn:UIButton={
        
        let b = UIButton()
        b.setImage(UIImage(named: "heart"), for: .normal)
        b.setImage(UIImage(named: "heart2"), for: .selected)
        return b
        
    }()
    
    
    let addBtn:UIButton={
        
        let b = UIButton()
        b.setImage(UIImage(named: "grey-cart"), for: .normal)
        b.setImage(UIImage(named: "green-cart"), for: .selected)
        return b
        
    }()

    
    func handelFavorit(sender:UIButton){
        
        let selected = sender.isSelected
        sender.isSelected = !selected
    }
    
    func addtocart(){
        
        
        if let del = self.delegate{
            if(addBtn.isSelected == true){
                addBtn.isSelected = false
                 del.addtobasket(seller: (product?.owner)!, product: product!)
            }else{
               Globals.basket.addProduct(seller: (product?.owner)!, product: product!)
               
                addBtn.isSelected = true
            }
        }
        
        
    }
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        
        setupView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView(){
        layer.borderWidth = 0.5
        layer.borderColor = Color.grey.lighten1.cgColor
        addSubview(imageView)
        addSubview(name)
        addSubview(seller)
        addSubview(price)
        addSubview(FavoriteBtn)
        addSubview(addBtn)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        _ = name.anchor(imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = seller.anchor(name.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = price.anchor(nil, left: leftAnchor , bottom: bottomAnchor , right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: 50, heightConstant: 30)
        
        _ = addBtn.anchor(nil, left: nil, bottom: bottomAnchor , right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 30, heightConstant: 30)
        
        _ = FavoriteBtn.anchor(nil, left: nil, bottom: bottomAnchor , right: addBtn.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 30, heightConstant: 30)
        
            FavoriteBtn.addTarget(self, action: #selector(handelFavorit), for: .touchUpInside)
            addBtn.addTarget(self, action: #selector(addtocart), for: .touchUpInside)
        
    }
    
    
}



import UIKit
import Material

class CategoryCell:UICollectionViewCell{
    
    
    
    var category:Category?{
        didSet{
            guard let category = category else{
                return
            }
            
            imageView.image = UIImage(named: category.image)
            name.text = category.name
      
        }
    }
    
    var imageView:UIImageView={
        let image = UIImage(named: "p8")
        let iv = UIImageView(image:image)
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        return iv
    }()
    
    
    let name:UILabel={
        let l = UILabel()
        l.text = "Brown Boots"
        l.backgroundColor = .clear
        l.font = UIFont(name: "Baskerville Bold", size: 17)
        l.layer.cornerRadius = 10
        l.layer.borderColor = UIColor.white.cgColor
        l.layer.borderWidth = 2
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    let overlay:UIView={
        let v = UIView()
        v.backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 0.3)
        return v
    }()
    
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView(){
        
        addSubview(imageView)
        addSubview(overlay)
        addSubview(name)

        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        overlay.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
       _ = name.anchor(nil, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 50, rightConstant: 0, widthConstant: 200, heightConstant: 40)
     
        name.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}

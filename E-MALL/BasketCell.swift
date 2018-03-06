



import UIKit
import Material

class BasketCell : UICollectionViewCell{

    
    var product:Product?{
    
        didSet{
        
            guard let product = product else{
                return
            }
            
            imgView.image = UIImage(named: product.image)
            name.text = product.name
            seller.text = product.owner
            price.text = "\(product.price)"
            count.text = "\(product.count)"
        }
    }
    
    var cnt:Int=1{
        didSet{
            count.text = "\(cnt)"
        }
    }
    
    var imgView:UIImageView = {
        let image=UIImage(named:"p3")
        let iv = UIImageView(image:image)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds  = true
        return iv
    }()
    
    var name:UILabel={
    
    let l = UILabel()
    l.text = "Product 1"
    l.font = UIFont.systemFont(ofSize: 12)
    return l
    }()
    
    var price:UILabel={
    
    let l = UILabel()
        l.text = "\(200)"
        l.font = UIFont.systemFont(ofSize: 12)
        return l
    
    }()
    
    
    let seller:UILabel={
    
        let l = UILabel()
        l.text = "addidas"
        l.font = UIFont.systemFont(ofSize: 10)
        l.textColor = Color.grey.lighten1
        return l
    }()
    
    
    let count:UILabel={
        let l = UILabel()
        l.text = "\(0)"
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 11)
        return l
    }()
    
    var incBtn:UIButton = {
        let b = UIButton()
        b.setImage(#imageLiteral(resourceName: "inc"), for: .normal)
        return b
    }()
    
    var decBtn:UIButton={
        let b = UIButton()
        b.setImage(#imageLiteral(resourceName: "dec"), for: .normal)
        return b
    }()
    
    let lineView:UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    
    let containerView:UIView={
        let v = UIView()
      //  v.layer.borderWidth = 1
    //    v.layer.borderColor  = UIColor(white: 0.9, alpha: 1).cgColor
        v.backgroundColor = .white
        return v
    }()
    
    let deleteBtn:UIButton={
    
        let b = UIButton()
        
        b.setImage(Icon.cm.clear, for: .normal)
        b.imageView?.contentMode = .scaleAspectFill
        b.tintColor = .white
        b.backgroundColor = .red
        return b
    }()
    
    
    let favoriteBtn:UIButton={
        
        let b = UIButton()
        
        b.setImage(Icon.favorite, for: .normal)
        b.imageView?.contentMode = .scaleAspectFill
        b.tintColor = .white
        b.backgroundColor = Color.grey.darken1
        return b
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupView(){
        

    addSubview(containerView)
    containerView.addSubview(imgView)
    containerView.addSubview(incBtn)
    containerView.addSubview(decBtn)
    containerView.addSubview(count)
    containerView.addSubview(name)
    containerView.addSubview(price)
    containerView.addSubview(seller)
    containerView.addSubview(lineView)
    addSubview(favoriteBtn)
    addSubview(deleteBtn)
    
        
        containerView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
       _ = imgView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: 100, heightConstant: 0)
        
        _ = incBtn.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 20, heightConstant: 20)
        
        _ = count.anchor(incBtn.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 20, heightConstant: 20)
        
        _ = decBtn.anchor(count.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 20, heightConstant: 20)
        
        _ = name.anchor(topAnchor, left: imgView.rightAnchor, bottom: nil, right: incBtn.leftAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        
        _ = seller.anchor(name.bottomAnchor, left: imgView.rightAnchor, bottom: nil, right: incBtn.leftAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        _ = price.anchor(seller.bottomAnchor, left: imgView.rightAnchor, bottom: nil, right: incBtn.leftAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        
        _ = deleteBtn.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -50, widthConstant: 50, heightConstant: 0)
        
        _ = favoriteBtn.anchor(topAnchor, left: nil , bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -50 , widthConstant: 50, heightConstant: 0)
        
        
        
      _ = lineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 1)
       incBtn.addTarget(self, action: #selector(handleinc), for: .touchUpInside)
        decBtn.addTarget(self, action: #selector(handledec), for: .touchUpInside)
        
        
        
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleDelete) )
        LeftSwipe.direction = UISwipeGestureRecognizerDirection.left
        addGestureRecognizer(LeftSwipe)
        
        let rightSwip = UISwipeGestureRecognizer(target: self, action: #selector(swipright) )
        rightSwip.direction = UISwipeGestureRecognizerDirection.right
        addGestureRecognizer(rightSwip)
        
        favoriteBtn.addTarget(self, action: #selector(p), for: .touchUpInside)
    
    }
    
    func handleDelete(){
        
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform(translationX: -100, y: 0)
            self.deleteBtn.transform = CGAffineTransform(translationX: -50, y: 0)
            self.favoriteBtn.transform = CGAffineTransform(translationX: -100, y: 0)
        })
    
    }
    
    func swipright(){
    
        
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
            self.deleteBtn.transform = CGAffineTransform.identity
            self.favoriteBtn.transform = CGAffineTransform.identity
        })
    }
    
    
    func handleinc(){
        cnt += 1
        
        Globals.basket.sellerBasket[(product?.owner)!]?.add(product: product!)
    }
    
    func handledec(){
        cnt = cnt > 1 ? cnt - 1:cnt
        Globals.basket.sellerBasket[(product?.owner)!]?.delete(product: product!)
    }
    
    func p (){
    
    print("favorite")
    }
}

//
//  LoginView.swift
//  DemoExpandingCollection
//
//  Created by Nour  on 6/20/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import Foundation
import UIKit


class StartView:UICollectionViewCell {
    
    var ratio = 0.552
    
    
    var Slogontopanchor          : NSLayoutConstraint?
    var Nametopanchor            : NSLayoutConstraint?
    var getStartedtopanchor      : NSLayoutConstraint?
    var haveAccounttopanchor     : NSLayoutConstraint?
    var linetopanchor            : NSLayoutConstraint?
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.ratio = Double(UIScreen.main.bounds.width / 750)
        render()
    }
    
    func injected() {
        render()
        print("I've been injected: \(self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    
    
    var NameLabel:UILabel = {
        let f = UILabel()
        
        f.font = UIFont(name: "Hoefler Text", size: 28)
        
        let attributedtext = NSMutableAttributedString(string: "SYRIA", attributes: [NSFontAttributeName:UIFont(name: "Hoefler Text", size: 24)!
            ,NSForegroundColorAttributeName:UIColor().mainColor()])
        
        attributedtext.append(NSAttributedString(string: " MALL", attributes: [NSFontAttributeName:UIFont(name: "Hoefler Text", size: 24)!,NSForegroundColorAttributeName:UIColor().SeconderyColor()]))
    
        f.attributedText = attributedtext
        f.textAlignment = .center
        return f
    }()
    
    
    var imageView:UIImageView = {
    
        
        let image = UIImage(named:"start")
        
        let iv = UIImageView(image: image)
        iv.contentMode  = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var SlogonLbl:UILabel={
    
    let f = UILabel()
        f.text = "All You need \n just in your forehand"
        f.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        f.textAlignment = .center
        f.numberOfLines = 2
        f.textColor = UIColor.white
    return f
    }()
    
    
   lazy var getStartedBtn : UIButton = {
    
        let b = UIButton()
    
        b.setTitle("Start Shopping", for: .normal)
        b.backgroundColor = UIColor().mainColor()
        b.setTitleColor(UIColor().SeconderyColor(), for: UIControlState.normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        b.layer.masksToBounds = false
        b.layer.shadowColor = UIColor.gray.cgColor;
        b.layer.shadowOpacity = 0.8;
        b.layer.shadowRadius = 10;
        b.layer.shadowOffset = CGSize(width: 10, height: 10)
        return b
    
    }()
   lazy var haveAccountBtn : UIButton = {
    
    let b = UIButton()
        
        b.setTitle("Alearedy have account?", for: .normal)
        b.backgroundColor = UIColor().SeconderyColor()
        b.setTitleColor(UIColor().mainColor(), for: UIControlState.normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize:18)
        b.layer.masksToBounds = false
        b.layer.shadowColor = UIColor.gray.cgColor;
        b.layer.shadowOpacity = 0.8;
        b.layer.shadowRadius = 10;
        b.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        return b
    
    }()
    
    
    let container : UIView = {
    
        let v = UIView()
        v.layer.cornerRadius = 3
        v.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return v
    }()
    
    
    
    let line : UIView = {
    
    let v = UIView()
    v.backgroundColor = .white
    
    return v
    
    }()
    
  
    func render()
    {
        let Nameleft:CGFloat = CGFloat(163 * ratio)
        let Nametop:CGFloat = CGFloat(150 * ratio)//350
        let NameWidth:CGFloat = CGFloat(424 * ratio)
        let NameHeight:CGFloat = CGFloat(115 * ratio)
        
        let Lineleft:CGFloat = CGFloat(275 * ratio)
        let Linetop:CGFloat = CGFloat(270 * ratio)//470
        let LineWidth:CGFloat = CGFloat(200 * ratio)
        let LineHeight:CGFloat = CGFloat(5 * ratio)
        
        let slogonleft:CGFloat = CGFloat(87 * ratio)
        let slogontop:CGFloat = CGFloat(350 * ratio)//550
        let slogonWidth:CGFloat = CGFloat(576 * ratio)
        let slogonHeight:CGFloat = CGFloat(100 * ratio)
        
        
        
        let getstartedtop:CGFloat = CGFloat(830 * ratio)//1030
        
        let getstartedHeight:CGFloat = CGFloat(150 * ratio)
        
        
        let signUpleft:CGFloat = CGFloat(0)
        let signUptop:CGFloat = CGFloat(1380 * ratio)//1180
        let signupRight:CGFloat = CGFloat(0)
        let signUpHeight:CGFloat = CGFloat(150 * ratio)
        
  
        addSubview(imageView)
        addSubview(container)
        container.addSubview(NameLabel)
        container.addSubview(SlogonLbl)
        container.addSubview(getStartedBtn)
        container.addSubview(haveAccountBtn)
        container.addSubview(line)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
       _ = container.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
       Nametopanchor = NameLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: Nametop, leftConstant: Nameleft, bottomConstant: 0, rightConstant: 0, widthConstant: NameWidth, heightConstant: NameHeight)[0]
        
        
       Slogontopanchor = SlogonLbl.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: slogontop, leftConstant: slogonleft, bottomConstant: 0, rightConstant: 0, widthConstant: slogonWidth, heightConstant: slogonHeight)[0]
      
        
       getStartedtopanchor = getStartedBtn.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: getstartedtop, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: getstartedHeight)[0]
        
        haveAccounttopanchor = haveAccountBtn.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: signUptop, leftConstant: signUpleft, bottomConstant: 0, rightConstant: signupRight, widthConstant: 0, heightConstant: signUpHeight)[0]
        
        
        linetopanchor = line.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: Linetop, leftConstant: Lineleft, bottomConstant: 0, rightConstant: 0, widthConstant: LineWidth, heightConstant: LineHeight)[0]
    }
    
}

import UIKit

class AgenciesSectionCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    let cellid = "AgencyCell"
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing  = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        return cv
    }()
    
    var agencies:[Agency] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupView(){
        
        addSubview(collectionView)

        collectionView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        let nib = UINib(nibName: "AgencySectionCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: cellid)
        
        
        agencies.append(Agency(image: "addidas1", name: "Addidas"))
        agencies.append(Agency(image: "nike", name: "Nike"))
        agencies.append(Agency(image: "puma", name: "Puma"))
        agencies.append(Agency(image: "diadora", name: "Diadora"))
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return agencies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! AgencySectionCell
            cell.agency = agencies[indexPath.item]
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio = Double(self.frame.width / 750)
        
        return CGSize(width: CGFloat(345 * ratio), height: self.height - 30 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showViewController(agency: agencies[indexPath.item])
    }
    
    
    func showViewController(agency:Agency){
        
        let vc = AgencyViewController()
        vc.navigationItem.titleLabel.text  = agency.name
        vc.navigationItem.titleLabel.textColor = .white
        vc.navigationItem.titleLabel.tintColor = .white
        (((self.window?.rootViewController as! AppNavigationDrawerController).rootViewController as! UITabBarController).selectedViewController as! AppNavigationController).pushViewController(vc, animated: true)
        
    }
    
}

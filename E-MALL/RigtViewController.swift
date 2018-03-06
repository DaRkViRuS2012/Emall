/*
 * Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Material



class RightViewController: UIViewController {
    fileprivate var transitionButton: FlatButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blue.base
        prepareView()
        prepareCells()
        prepareTableView()
        //prepareTransitionButton()
    }
    
    
    let tableView: UITableView = UITableView()
    
    /// A list of all the navigation items.
    var items: Array<Item> = Array<Item>()
    
    let nameLabel: UILabel = UILabel()
    
    
    
    func showView(VC:UIViewController) {
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
     //   prepareProfileView()
    }
    
    
    
    
    /// General preparation statements.
    private func prepareView() {
        view.backgroundColor = Color.grey.darken4
    }
    
    /// Prepares the items that are displayed within the tableView.
    private func prepareCells() {
        items.removeAll()
        
        items.append(Item(text: "Clothes", imageName: "ic_today"))
        items.append(Item(text: "Computers", imageName: "ic_place_white"))
        items.append(Item(text: "Fashion", imageName: "ic_home_white"))
        items.append(Item(text: "Mobiles", imageName: "ic_home_white"))
        items.append(Item(text: "Fashion", imageName: "ic_home_white"))
        
    }
    
    /// Prepares profile view.
    private func prepareProfileView() {
        let backgroundView: View = View()
        backgroundView.image = UIImage(named: "MaterialBackground")
        
        let profileView: View = View()
        profileView.image = UIImage(named: "Profile9")?.resize(toWidth: 72)
        profileView.backgroundColor = Color.clear
        profileView.shapePreset = .circle
        profileView.borderColor = Color.white
        profileView.borderWidth = 3
        
        
        
        
        nameLabel.textColor = Color.white
        nameLabel.font = RobotoFont.medium(with:16)
        
        view.layout(profileView).width(72).height(72).top(30).centerHorizontally()
        view.layout(nameLabel).top(130).left(20).right(20)
    }
    
    /// Prepares the tableView.
    private func prepareTableView() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.backgroundColor = Color.clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        // Use Layout to easily align the tableView.
        view.layout(tableView).edges(top: 170)
    }
    
    
    
    
}


extension RightViewController {
    @objc
    
    
    fileprivate func closeNavigationDrawer(result: Bool) {
        navigationDrawerController?.closeLeftView()
    }
}


extension RightViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let item: Item = items[indexPath.row]
        
        cell.textLabel!.text = item.text
        cell.textLabel!.textColor = Color.grey.lighten2
        cell.textLabel!.font = RobotoFont.medium
        cell.imageView!.image = UIImage(named: item.imageName)?.withRenderingMode(.alwaysTemplate)
        cell.imageView!.tintColor = Color.grey.lighten2
        cell.backgroundColor = Color.clear
        
        return cell
    }
    
    /// Determines the number of rows in the tableView.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
}

/// UITableViewDelegate methods.
extension RightViewController: UITableViewDelegate {
    /// Sets the tableView cell height.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    
    
    
    func transitionToViewController(viewController:UIViewController){
        
        ((navigationDrawerController?.rootViewController as? UITabBarController)?.selectedViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
        navigationDrawerController?.toggleRightView()
    }
    
    
    func show(viewController:UIViewController){
        navigationDrawerController?.toggleLeftView()
        let vc = UINavigationController(rootViewController: viewController)
        self.present(vc, animated: true, completion: nil)
        
    }
    /// Select item at row in tableView.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //   showView(LoginViewController())
        
     
            let vc = CategoryViewController()
            transitionToViewController(viewController: vc)
            
      
        
        
    }
    
}






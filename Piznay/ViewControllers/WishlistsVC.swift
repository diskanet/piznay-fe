//
//  WishlistsVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation

class WishlistsVC: BasicVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.Yellow._100
    }
    override func setupNavBar() {
        super.setupNavBar()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension WishlistsVC {
    
}

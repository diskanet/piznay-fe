//
//  BasicVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import UIKit

class BasicVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupNavBar()
    }
    
    func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = Colors.Base.white
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.standardAppearance = appearance
    }
    
    private func setupVC() {
        self.view.backgroundColor = Colors.Base.white
    }
}

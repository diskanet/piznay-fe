//
//  TabBarVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupTabBarController()
    }
}

extension TabBarVC {
    
    private func setupTabBarController() {
        
        self.view.backgroundColor = Colors.Base.white
        
        // MARK: Create tabs (UINavigationController)
        
        let homeVC = HomeVC()
        let exploreVC = ExploreVC()
        let wishlistsVC = WishlistsVC()
        let profileVC = ProfileVC()
        
        // MARK: Create a UINavigationController for each tab
        
        let homeNavController = UINavigationController(rootViewController: homeVC)
        let exploreNavController = UINavigationController(rootViewController: exploreVC)
        let wishlistsNavController = UINavigationController(rootViewController: wishlistsVC)
        let profileNavController = UINavigationController(rootViewController: profileVC)
        
        // MARK: Configure tabs
        
        let homeIconDefault = UIImage(named: "homeDefault")
        let homeIconActive = UIImage(named: "homeActive")
        
        let exploreIconDefault = UIImage(named: "exploreDefault")
        let exploreIconActive = UIImage(named: "exploreActive")
        
        let wishlistsIconDefault = UIImage(named: "favoritesDefault")
        let wishlistsIconActive = UIImage(named: "favoritesActive")
        
        let profileIconDefault = UIImage(named: "profileDefault")
        let profileIconActive = UIImage(named: "profileActive")
        
        configureTabBarItem(for: homeNavController, navTitle: "Home", tabTitle: nil, image: homeIconDefault, selectedImage: homeIconActive)
        configureTabBarItem(for: exploreNavController, navTitle: "Explore", tabTitle: nil, image: exploreIconDefault, selectedImage: exploreIconActive)
        configureTabBarItem(for: wishlistsNavController, navTitle: "Favorites", tabTitle: nil, image: wishlistsIconDefault, selectedImage: wishlistsIconActive)
        configureTabBarItem(for: profileNavController, navTitle: "Profile", tabTitle: nil, image: profileIconDefault, selectedImage: profileIconActive)
        
        // MARK: Adding a UINavigationController to the TabBarController
        
        viewControllers = [exploreNavController, wishlistsNavController, profileNavController]
        
        // MARK: Setting the background of the tab bar
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = Colors.Base.white
        
        // MARK: Set the top border for the Tab Bar
//        tabBar.addTopBorder(color: Colors.Neutral._900, height: 0.5)
    }
    
    func configureTabBarItem(
        for navigationController: UINavigationController,
        navTitle: String,
        tabTitle: String?,
        image: UIImage?,
        selectedImage: UIImage?
    ) {
        
        guard let image = image?.withRenderingMode(.alwaysOriginal),
              let selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        else { return }
        
        navigationController.viewControllers.first?.title = navTitle
        
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: image.withTintColor(Colors.Neutral._750),
            selectedImage: selectedImage.withTintColor(Colors.Neutral._150)
        )
        
        // Center the icon vertically
        let tabBarItemImageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        navigationController.tabBarItem.imageInsets = tabBarItemImageInsets
    }
}

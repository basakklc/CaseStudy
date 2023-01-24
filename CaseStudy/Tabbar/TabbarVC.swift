//
//  TabbarVC.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit

class TabbarVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tabbarVC = UITabBarController()
        
        let discoverVC = tabbarVC.createTabItem(vc: DiscoverVC(), vm: DiscoverVM(repository: DiscoverRepository()), iconName: "DiscoverIcon")
        let reviewsVC = tabbarVC.createTabItem(vc: ReviewsVC(), vm: ReviewsVM(repository: ReviewsRepository()), iconName: "ReviewsIcon")
        let shoppingCartVC = tabbarVC.createTabItem(vc: ShoppingCartVC(), vm: ShoppingCartVM(repository: ShoppingCartRepository()), iconName: "ShoppingCartIcon")
        let favoritesVC = tabbarVC.createTabItem(vc: FavoritesVC(), vm: FavoritesVM(repository: FavoritesRepository()), iconName: "FavoritesIcon")
        let settingsVC = tabbarVC.createTabItem(vc: SettingsVC(), vm: SettingsVM(repository: SettingsRepository()), iconName: "SettingsIcon")

        tabbarVC.setViewControllers([discoverVC, reviewsVC, shoppingCartVC, favoritesVC, settingsVC], animated: true)
        tabbarVC.tabBar.backgroundColor = .white
        tabbarVC.modalPresentationStyle = .fullScreen
        present(tabbarVC, animated: false, completion: nil)
    }
}

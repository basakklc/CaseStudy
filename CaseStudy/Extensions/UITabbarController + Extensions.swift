//
//  UITabbarController + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/24/23.
//

import Foundation
import UIKit

extension UITabBarController {
    func createTabItem<T>(vc: BaseVC<T>, vm: T, iconName: String) -> UIViewController{
        let vc = vc
        vc.viewModel = vm
        let item = UINavigationController(rootViewController: vc)
        vc.tabBarItem.image = UIImage(named: iconName)
        return item
    }
}

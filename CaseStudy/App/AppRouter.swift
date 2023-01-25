//
//  AppRouter.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import Foundation
import UIKit

class AppRouter {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let vc = ViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

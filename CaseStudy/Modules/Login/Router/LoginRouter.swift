//
//  LoginRouter.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import Foundation
import UIKit

class LoginRouter: RouterProtocol {
    
//    let viewModel: LoginVM
//
//    init(viewModel: LoginVM) {
//        self.viewModel = viewModel
//    }
//
    func route(to: String, from: UIViewController, parameters: Any?) {
        guard let route = LoginVC.Route(rawValue: to) else { return }
        switch route {
            case .discover:
                let vc = TabbarVC()
                from.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
}

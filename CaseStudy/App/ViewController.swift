//
//  ViewController.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc  = LoginVC()
        let vm = LoginVM(repository: LoginRepository())
        let router = LoginRouter()
        vc.viewModel = vm
        vc.router = router
        navigationController?.pushViewController(vc, animated: true)
    }


}


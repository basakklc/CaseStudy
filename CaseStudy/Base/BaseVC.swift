//
//  BaseVC.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit
import RxSwift
import RxReachability
import Reachability

class BaseVC<T>: UIViewController where T: BaseVM {

    var viewModel: T?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.error.subscribe(onNext : {message  in
            let alert = UIAlertController(title: "DefineX Case Study", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }).disposed(by: disposeBag)
    }
    
    func showMessage(withTitle _title: String? = "DefineX Case Study",
                     withMessage _message: String,
                     buttonTitle: String? = "OK",
                     callBack: (()->())? = nil) {
        
        let alert = UIAlertController(title: _title!, message: _message, preferredStyle: .alert)
        let cancelAction:UIAlertAction!
        
        if let cb = callBack{
            cancelAction = UIAlertAction(title: buttonTitle!, style: .destructive, handler: { (action) in
                cb()
            })
        }else{
            cancelAction = UIAlertAction(title: buttonTitle!, style: .destructive)
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

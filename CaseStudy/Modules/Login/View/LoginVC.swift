//
//  LoginVC.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit
import RxCocoa
import RxSwift
import Reachability

class LoginVC: BaseVC<LoginVM> {

    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    
    enum Route: String {
        case discover
    }
    
    var router: RouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindUI()
        bindViewModel()
    }

    func configure() {
        forgotPasswordBtn.layer.borderWidth = 1.0
        forgotPasswordBtn.layer.borderColor = Colors.borderColor?.cgColor
        forgotPasswordBtn.layer.cornerRadius = forgotPasswordBtn.frame.height / 2
        
    }
    
    func bindUI()    {
        loginBtn.rx.tap.bind{
            guard let email = self.emailTF.text else { return }
            guard let password = self.passwordTF.text else { return }
            if email.count == 0 || password.count == 0 { self.showMessage(withMessage: ErrorMessages.emptySpace ?? "") }
            
            let reachability = try! Reachability()
            if !reachability.connectionControl() { self.showMessage(withMessage: ErrorMessages.notConnection ?? "") }
            self.viewModel?.login()
            
        }.disposed(by: disposeBag)
        
        forgotPasswordBtn.rx.tap.bind{
            self.showMessage(withMessage: "ComingSoon".localized)
        }.disposed(by: disposeBag)
        
        facebookBtn.rx.tap.bind{
            if let url = URL(string: StaticUrl.facebookUrl.rawValue) { UIApplication.shared.open(url) }
        }.disposed(by: disposeBag)
        
        twitterBtn.rx.tap.bind{
            if let url = URL(string: StaticUrl.twitterUrl.rawValue) { UIApplication.shared.open(url) }
        }.disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        viewModel?.loginResponse.subscribe(onNext: { isLogin in
            guard let email = self.emailTF.text else { return }
            guard let password = self.passwordTF.text else { return }
            isLogin ? self.viewModel?.credentialControl(email: email, password: password) : self.showMessage(withMessage: ErrorMessages.loginDenied ?? "")
        }).disposed(by: disposeBag)
        
        viewModel?.isCredential.subscribe(onNext: { isCredential in
            isCredential ? self.router.route(to: Route.discover.rawValue, from: self, parameters: nil) : self.showMessage(withMessage: ErrorMessages.loginIncorrectly ?? "")
        }).disposed(by: disposeBag)
    }

}

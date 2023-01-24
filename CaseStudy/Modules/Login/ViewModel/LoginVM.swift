//
//  LoginVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit
import RxSwift

class LoginVM: BaseVM {
    
    let repository: LoginRepositoryProtocol
    let loginResponse = PublishSubject<Bool>()
    let isCredential = PublishSubject<Bool>()
    
    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }
    
    func login() {
        repository.login().subscribe(onNext: { response in
            self.loginResponse.onNext(response.isSuccess)
        }, onError: { message in
            self.error.onNext(message.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func credentialControl(email: String, password: String) {
        repository.credentialControl(email: email, password: password).subscribe(onNext: { isCredential in
            self.isCredential.onNext(isCredential)
        }, onError: { message in
            self.error.onNext(message.localizedDescription)
        }).disposed(by: disposeBag)
    }

}

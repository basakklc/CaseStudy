//
//  LoginRepository.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import Foundation
import RxSwift

protocol LoginRepositoryProtocol{
    func login() -> Observable<LoginResponse>
    func credentialControl(email: String, password: String) -> Observable<Bool>
}

class LoginRepository: BaseRepository, LoginRepositoryProtocol{
    func login() -> Observable<LoginResponse> {
        NetworkManager.shared.request(.login)
    }
    
    func credentialControl(email: String, password: String) -> Observable<Bool> {
        Observable.just((email == NetworkManager.user.email) && (password == NetworkManager.user.password))
    }
}



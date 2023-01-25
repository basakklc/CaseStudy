//
//  LoginRemoteDataService.swift
//  CaseStudy
//
//  Created by Başak on 24.01.2023.
//

import Foundation
import RxSwift

struct LoginRemoteDataService: LoginDataService {
    func login() -> Observable<LoginResponse> {
        NetworkManager.shared.request(.login)
    }
}

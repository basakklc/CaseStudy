//
//  LoginService.swift
//  CaseStudy
//
//  Created by Başak on 24.01.2023.
//

import Foundation
import RxSwift

protocol LoginDataService{
    func login() -> Observable<LoginResponse>
}

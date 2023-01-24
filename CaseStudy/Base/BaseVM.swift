//
//  BaseVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import Moya
import RxRelay
import RxSwift

class BaseVM {
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
    var moyaError: MoyaError!
    let disposeBag = DisposeBag()
}


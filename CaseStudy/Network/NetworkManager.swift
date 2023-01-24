//
//  NetworkManager.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//


import Moya
import RxSwift
import RxMoya
import Alamofire
import Foundation

struct NetworkManager {

    private let provider = MoyaProvider<API> (session: DefaultAlamofireSession.shared)
    static let shared = NetworkManager()
    static var user = LoginUser()
        
    init() {}
    
    func request<T: Codable>(_ request: API) -> Observable<T> {
        self.provider.rx
            .request(request)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map{ (result) in
                return try result.map ( T.self )
            }
            .catch { error in
                return Observable.error(error)
            }
    }
    
    func requestPlain<T: Codable>(_ request: API) -> Observable<T> {
        self.provider.rx
            .request(request)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map{ (result) in
                return try result.map ( BaseResponse<T>.self ).list
            }
            .catch { error in
                return Observable.error(error)
            }
    }
}

class DefaultAlamofireSession: Alamofire.Session {
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        return DefaultAlamofireSession(configuration: configuration)
    }()
}


//
//  DiscoverRepository.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import RxSwift
import Reachability

protocol DiscoverRepositoryProtocol{
    func getDiscoverFirst() -> Observable<BaseResponse<[DiscoverResponse]>>
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>>
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>>
}

class DiscoverRepository: BaseRepository, DiscoverRepositoryProtocol{
    
    var isReachable: Bool = true
    let disposeBag: DisposeBag = DisposeBag()
    
    var dataService: DiscoverDataService {
        if reachability.connectionControl() {
            return DiscoverRemoteDataService()
        }
        return DiscoverLocalDataService()
    }
    
    func getDiscoverFirst() -> Observable<BaseResponse<[DiscoverResponse]>> {
        return dataService.getDiscoverFirst()
    }
    
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>> {
        dataService.getDiscoverSecond()
    }
    
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>> {
        dataService.getDiscoverThird()
    }
    
//    func connectionControl() {
//        let reachability = try! Reachability()
//        switch reachability.connection {
//        case .unavailable:
//            isReachable = false
//        default:
//            isReachable = true
//        }
//    }
}

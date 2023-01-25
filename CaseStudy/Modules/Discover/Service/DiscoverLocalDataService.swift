//
//  LocalDataService.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import RxSwift

struct DiscoverLocalDataService: DiscoverDataService {
    func getDiscoverFirst() -> Observable<BaseResponse<[DiscoverResponse]>> {
        guard let result = CacheManager.shared.getObjectByKey(DiscoverRequestType.firstHorizontal.rawValue) as? BaseResponse<[DiscoverResponse]> else {
            let empty: BaseResponse<[DiscoverResponse]> = BaseResponse(list: [], isSuccess: false, message: "", statusCode: "")
            return Observable.just(empty)
        }
        return Observable.just(result)
    }
    
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>> {
        guard let result = CacheManager.shared.getObjectByKey(DiscoverRequestType.secondHorizontal.rawValue) as? BaseResponse<[DiscoverResponse]> else {
            let empty: BaseResponse<[DiscoverResponse]> = BaseResponse(list: [], isSuccess: false, message: "", statusCode: "")
            return Observable.just(empty)
        }
        return Observable.just(result)
    }
    
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>>{
        guard let result = CacheManager.shared.getObjectByKey(DiscoverRequestType.thirdVertical.rawValue) as? BaseResponse<[DiscoverResponse]> else {
            let empty: BaseResponse<[DiscoverResponse]> = BaseResponse(list: [], isSuccess: false, message: "", statusCode: "")
            return Observable.just(empty)
        }

        return Observable.just(result)
    }
}

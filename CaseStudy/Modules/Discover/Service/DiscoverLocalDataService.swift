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
        Observable.just(CacheManager.shared.getObjectByKey("firstHorizontal") as! BaseResponse<[DiscoverResponse]>)
    }
    
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>> {
        let result = CacheManager.shared.getObjectByKey("secondHorizontal")
        return Observable.just(result as! BaseResponse<[DiscoverResponse]>)
    }
    
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>>{
        Observable.just(CacheManager.shared.getObjectByKey("thirdVertical") as! BaseResponse<[DiscoverResponse]>)
    }
}

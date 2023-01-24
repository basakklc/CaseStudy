//
//  RemoteDataService.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import RxSwift

struct DiscoverRemoteDataService: DiscoverDataService {
    func getDiscoverFirst() -> Observable<BaseResponse<[DiscoverResponse]>> {
        NetworkManager.shared.request(.discoverFirst)
    }
    
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>> {
        NetworkManager.shared.request(.discoverSecond)
    }
    
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>> {
        NetworkManager.shared.request(.discoverThird)
    }
}

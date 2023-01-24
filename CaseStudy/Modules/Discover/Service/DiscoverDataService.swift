//
//  DataService.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import RxSwift

protocol DiscoverDataService{
    func getDiscoverFirst() -> Observable<BaseResponse<[DiscoverResponse]>>
    func getDiscoverSecond() -> Observable<BaseResponse<[DiscoverResponse]>>
    func getDiscoverThird() -> Observable<BaseResponse<[DiscoverResponse]>>

}

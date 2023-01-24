//
//  DiscoverVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import RxSwift
import RxRelay
import Reachability

class DiscoverVM: BaseVM {
    let repository: DiscoverRepositoryProtocol
    
    let discoverFirstResponse = PublishSubject<[DiscoverModel]>()
    let discoverSecondResponse = PublishSubject<[DiscoverModel]>()
    let discoverThirdResponse = BehaviorRelay<[DiscoverModel]>(value: [])
    
    let isFirstLoaded = PublishSubject<Bool>()
    let isSecondLoaded = PublishSubject<Bool>()
    let isThirdLoaded = PublishSubject<Bool>()
    
    init(repository: DiscoverRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDiscoverFirst() {
        repository.getDiscoverFirst().subscribe(onNext: { response in
            self.toCache(response: response, requestType: .firstHorizontal)
            self.discoverFirstResponse.onNext(self.createDiscoverModels(list: response.list,requestType: .firstHorizontal))
        },onError: { message in
            self.error.onNext(message.localizedDescription)
        }, onCompleted: {
            self.isFirstLoaded.onNext(true)
        }).disposed(by: disposeBag)
    }
    
    func getDiscoverSecond() {
        repository.getDiscoverSecond().subscribe(onNext: { response in
            self.toCache(response: response, requestType: .secondHorizontal)
            self.discoverSecondResponse.onNext(self.createDiscoverModels(list: response.list,requestType: .secondHorizontal))
        },onError: { message in
            self.error.onNext(message.localizedDescription)
        }, onCompleted: {
            self.isSecondLoaded.onNext(true)
        }).disposed(by: disposeBag)
    }
    
    func getDiscoverThird() {
        repository.getDiscoverThird().subscribe(onNext: { response in
            self.toCache(response: response, requestType: .thirdVertical)
            self.discoverThirdResponse.accept(self.createDiscoverModels(list: response.list,requestType: .thirdVertical))
        },onError: { message in
            self.error.onNext(message.localizedDescription)
        }, onCompleted: {
            self.isThirdLoaded.onNext(true)
        }).disposed(by: disposeBag)
    }
}

extension DiscoverVM {
    func createDiscoverModels(list: [DiscoverResponse], requestType: DiscoverRequestType) -> [DiscoverModel] {
        let mapped = list.map { item in
           
            let price = " \(String(describing: item.price.value)) \(String(describing: item.price.currency))"
            var oldPrice = ""
            if let oPrice = item.oldPrice {
                 oldPrice = " \(String(describing: oPrice.value)) \(String(describing: oPrice.currency))"
            }
          
            return DiscoverModel(cellType: getCellType(requestType: requestType, item: item),
                          imageURL: item.imageUrl,
                          description: item.description,
                          price: price,
                          oldPrice: oldPrice,
                          discount: item.discount,
                          ratePercentage: item.ratePercentage ?? 0)
        }
        return mapped
    }
    
    func getCellType(requestType: DiscoverRequestType, item: DiscoverResponse) -> DiscoverCVCellType {
        var cellType: DiscoverCVCellType = .onlyPriced
        switch requestType {
        case .firstHorizontal:
            cellType = .withDiscountCell
        case .secondHorizontal:
            cellType = .onlyPriced
        case .thirdVertical:
            if item.discount == "" && item.ratePercentage != nil {
                cellType = .withRateCell
            }else if item.discount != "" && item.ratePercentage != nil {
                cellType = .bothDiscountRateCell
            }else if item.discount != "" && item.ratePercentage == nil {
                cellType = .withDiscountCell
            }
        }
        return cellType
    }
    
    func connectionControl() -> Bool{
        let reachability = try! Reachability()
        var isReachable: Bool = false
        switch reachability.connection {
        case .unavailable:
            isReachable = false
        default:
            isReachable = true
        }
        return isReachable
    }
    
    func toCache(response: BaseResponse<[DiscoverResponse]>, requestType: DiscoverRequestType) {
        if self.connectionControl(){
            CacheManager.shared.setObjectByKey(requestType.rawValue, cacheObject: response as AnyObject)
         }
    }
}


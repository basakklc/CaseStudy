//
//  CellType.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import Foundation

enum DiscoverCVCellType: Int {
    case onlyPriced
    case withDiscountCell
    case withRateCell
    case bothDiscountRateCell
}

enum DiscoverRequestType: String {
    case firstHorizontal
    case secondHorizontal
    case thirdVertical
    
    func getCellType(item: DiscoverResponse) -> DiscoverCVCellType {
        var cellType: DiscoverCVCellType = .onlyPriced
        switch self {
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
}

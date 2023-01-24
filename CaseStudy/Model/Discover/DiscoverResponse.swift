//
//  DiscoverResponse.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

// MARK: - DiscoverResponse
struct DiscoverResponse: Codable {
    let imageUrl: String
    let description: String
    let price: Price
    let oldPrice: Price?
    let discount: String
    let ratePercentage: Int?
    

    enum CodingKeys: String, CodingKey {
        case imageUrl
        case description, price
        case oldPrice = "old_price"
        case discount
        case ratePercentage = "rate_percentage"
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Double
    let currency: String
}

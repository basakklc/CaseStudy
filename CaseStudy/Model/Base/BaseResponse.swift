//
//  BaseResponse.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

// MARK: - BaseResponse
struct BaseResponse<T : Codable>: Codable {
    var list: T
    let isSuccess: Bool?
    let message, statusCode: String
}

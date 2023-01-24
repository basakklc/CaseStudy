//
//  LoginResponse.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let isSuccess: Bool
    let message, statusCode: String
}

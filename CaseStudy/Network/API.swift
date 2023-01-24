//
//  API.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation
import Moya

enum API{
    case login
    case discoverFirst
    case discoverSecond
    case discoverThird
}

extension API : TargetType{
    var baseURL: URL{
        return URL(string: "https://teamdefinex-mobile-casestudy.vercel.app")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login.json"
        case .discoverFirst:
            return "/discover_first_horizontal_list.json"
        case .discoverSecond:
            return "/discover_second_horizontal_list.json"
        case .discoverThird:
            return "/discover_thirth_two_column_list.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login,.discoverFirst,.discoverSecond, .discoverThird:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login,.discoverFirst, .discoverSecond, .discoverThird:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Cache-Control":"no-cache"]
        }
    }
}



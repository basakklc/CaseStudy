//
//  Reachability + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/24/23.
//

import Foundation
import Reachability

extension Reachability{
    func connectionControl() -> Bool {
        var isReachable: Bool?
        switch self.connection {
        case .unavailable:
            isReachable = false
        default:
            isReachable = true
        }
        return isReachable ?? false
    }
}

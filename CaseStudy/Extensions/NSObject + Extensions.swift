//
//  NSObject + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/24/23.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }

    public static var className: String {
        return String(describing: self)
    }
}

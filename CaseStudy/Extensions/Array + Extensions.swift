//
//  Array + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import Foundation

extension Array where Element:Equatable {
    
    public mutating func remove(_ item: Element ) {
        var index = 0
        while index < self.count {
            if self[index] == item {
                self.remove(at: index)
            } else {
                index += 1
            }
        }
    }
}

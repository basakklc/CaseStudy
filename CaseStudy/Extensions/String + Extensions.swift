//
//  String + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import Foundation
import UIKit

extension String {
    func createAttributedString(stringToStrike: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
}

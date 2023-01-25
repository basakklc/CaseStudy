//
//  UIView + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 24.01.2023.
//

import Foundation
import UIKit

extension UIView {    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}


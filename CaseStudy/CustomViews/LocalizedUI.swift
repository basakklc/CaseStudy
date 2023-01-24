//
//  LocalizedLabel.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import UIKit

protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

protocol IBLocalizable {
    var stbLocKey: String? { get set }
}

extension UILabel: IBLocalizable {
    @IBInspectable var stbLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}

extension UIButton: IBLocalizable {
    @IBInspectable var stbLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}

extension CustomTextField: IBLocalizable {
    @IBInspectable var stbLocKey: String? {
        get { return "" }
        set {
            _placeholder = newValue?.localized
            placeholder = newValue?.localized
        }
    }
}


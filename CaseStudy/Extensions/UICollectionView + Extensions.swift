//
//  UICollectionView + Extensions.swift
//  CaseStudy
//
//  Created by Başak on 1/24/23.
//

import UIKit

extension UICollectionView {
    func registerCell<T:UICollectionViewCell>(cell:T.Type) {
        let nib = UINib(nibName: T.className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.className)
    }
}

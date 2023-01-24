//
//  ShoppingCartVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

class ShoppingCartVM: BaseVM {
    let repository: ShoppingCartRepositoryProtocol
    
    init(repository: ShoppingCartRepositoryProtocol) {
        self.repository = repository
    }
}

//
//  FavoritesVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

class FavoritesVM: BaseVM {
    let repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }
}

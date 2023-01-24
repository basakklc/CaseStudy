//
//  ReviewsVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

class ReviewsVM: BaseVM {
    let repository: ReviewsRepositoryProtocol
    
    init(repository: ReviewsRepositoryProtocol) {
        self.repository = repository
    }
}

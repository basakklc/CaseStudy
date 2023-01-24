//
//  SettingsVM.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import Foundation

class SettingsVM: BaseVM {
    let repository: SettingsRepositoryProtocol
    
    init(repository: SettingsRepositoryProtocol) {
        self.repository = repository
    }
}

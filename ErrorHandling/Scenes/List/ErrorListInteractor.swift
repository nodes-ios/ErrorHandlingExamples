//
//  ErrorListInteractor.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

class ErrorListInteractor {
    // MARK: - Properties
    weak var output: ErrorListInteractorOutput?

    // MARK: - Init
    init() {
        
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension ErrorListInteractor: ErrorListInteractorInput {
}

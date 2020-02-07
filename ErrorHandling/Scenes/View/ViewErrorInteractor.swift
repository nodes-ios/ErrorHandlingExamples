//
//  ViewErrorInteractor.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import Foundation

class ViewErrorInteractor {
    // MARK: - Properties
    weak var output: ViewErrorInteractorOutput?

    // MARK: - Init
    init() {
        
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension ViewErrorInteractor: ViewErrorInteractorInput {
    func perform(_ request: ViewError.Request.LoadStuff) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.output?.present(ViewError.Response.StuffResponse())
        })
    }
}

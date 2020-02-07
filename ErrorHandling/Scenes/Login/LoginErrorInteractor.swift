//
//  LoginErrorInteractor.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

class LoginErrorInteractor {
    // MARK: - Properties
    weak var output: LoginErrorInteractorOutput?

    // MARK: - Init
    init() {
        
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension LoginErrorInteractor: LoginErrorInteractorInput {
    func perform(_ request: LoginError.Request.Login) {
        output?.present(LoginError.Response.Login())
    }
}

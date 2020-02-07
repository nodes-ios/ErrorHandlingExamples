//
//  LoginErrorPresenter.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

class LoginErrorPresenter {
    // MARK: - Properties
    let interactor: LoginErrorInteractorInput
    weak var coordinator: LoginErrorCoordinatorInput?
    weak var output: LoginErrorPresenterOutput?

    // MARK: - Init
    init(interactor: LoginErrorInteractorInput, coordinator: LoginErrorCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension LoginErrorPresenter: LoginErrorPresenterInput {
    func viewCreated() {

    }

    func handle(_ action: LoginError.Action) {
        switch action {
        case .login:
            interactor.perform(LoginError.Request.Login())
        case .createUser:
            submit()
        case .invalidEmail:
            submit(emailValid: false)
        case .invalidPassword:
            submit(passwordValid: false)
        }
    }
    
    private func submit(emailValid: Bool = true, passwordValid: Bool = true) {
        let invalidEmail = emailValid ? nil : "Invalid email"
        let invalidPassword = passwordValid ? nil : "Invalid passowrd"
        output?.display(LoginError.DisplayData.ValidationError(emailError: invalidEmail, passwordError: invalidPassword))
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension LoginErrorPresenter: LoginErrorInteractorOutput {
    func present(_ response: LoginError.Response.Login) {
        output?.display(LoginError.DisplayData.LoginError(message: "Wrong email or password"))
    }
}

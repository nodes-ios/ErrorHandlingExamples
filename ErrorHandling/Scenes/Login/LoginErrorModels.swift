//
//  LoginErrorModels.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

enum LoginError {
    enum Request { }
    enum Response { }
    enum DisplayData { }

    enum Action {
        case createUser, invalidEmail, invalidPassword, login
    }

    enum Route {

    }
}

extension LoginError.Request {
    struct Login {}
}

extension LoginError.Response {
    struct Login {}
}

extension LoginError.DisplayData {
    struct ValidationError {
        let emailError: String?
        let passwordError: String?
    }
    struct LoginError {
        let message: String
    }
}

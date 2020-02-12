//
//  ViewErrorModels.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import Foundation

enum ViewError {
    enum Request { }
    enum Response { }
    enum DisplayData { }

    enum Action {
        case doLoad, tokenExpired
    }

    enum Route {
        case goToLogin
    }
}

extension ViewError.Request {
    struct LoadStuff {}
}

extension ViewError.Response {
    struct StuffResponse {}
}

extension ViewError.DisplayData {
    struct Error {}
}

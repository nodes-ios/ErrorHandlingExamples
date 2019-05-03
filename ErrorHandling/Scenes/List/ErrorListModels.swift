//
//  ErrorListModels.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

enum ErrorList {
    enum Request { }
    enum Response { }
    enum DisplayData { }

    enum Action {
        case data, empty
    }

    enum Route {

    }
}

extension ErrorList.Request {

}

extension ErrorList.Response {

}

extension ErrorList.DisplayData {
    struct Reload {
        let state: ErrorListViewController.State
    }
}

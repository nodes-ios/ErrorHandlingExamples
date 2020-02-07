//
//  LoginErrorProtocols.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol LoginErrorCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol LoginErrorCoordinatorInput: class {
    func navigate(to route: LoginError.Route)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol LoginErrorInteractorInput {
     func perform(_ request: LoginError.Request.Login)
}

// INTERACTOR -> PRESENTER (indirect)
protocol LoginErrorInteractorOutput: class {
     func present(_ response: LoginError.Response.Login)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol LoginErrorPresenterInput {
    func viewCreated()
    func handle(_ action: LoginError.Action)
}

// PRESENTER -> VIEW
protocol LoginErrorPresenterOutput: class {
    func display(_ displayModel: LoginError.DisplayData.ValidationError)
    func display(_ displayModel: LoginError.DisplayData.LoginError)
}

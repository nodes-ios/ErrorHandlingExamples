//
//  ViewErrorProtocols.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol ViewErrorCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol ViewErrorCoordinatorInput: class {
    func navigate(to route: ViewError.Route)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol ViewErrorInteractorInput {
     func perform(_ request: ViewError.Request.LoadStuff)
}

// INTERACTOR -> PRESENTER (indirect)
protocol ViewErrorInteractorOutput: class {
     func present(_ response: ViewError.Response.StuffResponse)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol ViewErrorPresenterInput {
    func viewCreated()
    func handle(_ action: ViewError.Action)
}

// PRESENTER -> VIEW
protocol ViewErrorPresenterOutput: class {
     func display(_ displayModel: ViewError.DisplayData.Error)
}

//
//  ErrorListProtocols.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation
import UIKit

typealias ErrorCell = UITableViewCell

// ======== Coordinator ======== //

//protocol ErrorListCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol ErrorListCoordinatorInput: class {
    func navigate(to route: ErrorList.Route)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol ErrorListInteractorInput {
    // func perform(_ request: ErrorList.Request.Work)
}

// INTERACTOR -> PRESENTER (indirect)
protocol ErrorListInteractorOutput: class {
    // func present(_ response: ErrorList.Response.Work)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol ErrorListPresenterInput {
    func viewCreated()
    func handle(_ action: ErrorList.Action)
    
    var numberOfRows: Int { get }
    func configure(_ cell: ErrorCell, at row: Int)
    
}

// PRESENTER -> VIEW
protocol ErrorListPresenterOutput: class {
    func display(_ displayModel: ErrorList.DisplayData.Reload)
}


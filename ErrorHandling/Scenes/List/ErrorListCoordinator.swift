//
//  ErrorListCoordinator.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation
import UIKit

class ErrorListCoordinator: Coordinator {
    // MARK: - Properties
    let navigationController: UINavigationController
    var children: [Coordinator] = []
//    weak var delegate: ErrorListCoordinatorDelegate?

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = ErrorListInteractor()
        let presenter = ErrorListPresenter(interactor: interactor, coordinator: self)
        let vc = ErrorListViewController.instantiate(with: presenter)

        interactor.output = presenter
        presenter.output = vc

        navigationController.setViewControllers([vc], animated: false)
    }
}
// MARK: - Navigation Callbacks
// PRESENTER -> COORDINATOR
extension ErrorListCoordinator: ErrorListCoordinatorInput {
    func navigate(to route: ErrorList.Route) {
        
    }
}

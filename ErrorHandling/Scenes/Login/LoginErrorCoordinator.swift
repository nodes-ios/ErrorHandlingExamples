//
//  LoginErrorCoordinator.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation
import UIKit

class LoginErrorCoordinator: Coordinator {
    // MARK: - Properties
    let navigationController: UINavigationController
    // NOTE: This array is used to retain child coordinators. Don't forget to
    // remove them when the coordinator is done.
    var children: [Coordinator] = []
//    weak var delegate: LoginErrorCoordinatorDelegate?

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = LoginErrorInteractor()
        let presenter = LoginErrorPresenter(interactor: interactor, coordinator: self)
        let vc = LoginErrorViewController.instantiate(with: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
        navigationController.setViewControllers([vc], animated: false)
    }
}
// MARK: - Navigation Callbacks
// PRESENTER -> COORDINATOR
extension LoginErrorCoordinator: LoginErrorCoordinatorInput {
    func navigate(to route: LoginError.Route) {
        
    }
}

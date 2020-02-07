//
//  ViewErrorCoordinator.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import Foundation
import UIKit

class ViewErrorCoordinator: Coordinator {
    // MARK: - Properties
    let navigationController: UINavigationController
    // NOTE: This array is used to retain child coordinators. Don't forget to
    // remove them when the coordinator is done.
    var children: [Coordinator] = []
//    weak var delegate: ViewErrorCoordinatorDelegate?

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = ViewErrorInteractor()
        let presenter = ViewErrorPresenter(interactor: interactor, coordinator: self)
        let vc = ViewErrorViewController.instantiate(with: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
         navigationController.setViewControllers([vc], animated: false)
    }
}
// MARK: - Navigation Callbacks
// PRESENTER -> COORDINATOR
extension ViewErrorCoordinator: ViewErrorCoordinatorInput {
    func navigate(to route: ViewError.Route) {
        
    }
}

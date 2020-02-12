//
//  ViewErrorPresenter.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import Foundation

class ViewErrorPresenter {
    // MARK: - Properties
    let interactor: ViewErrorInteractorInput
    weak var coordinator: ViewErrorCoordinatorInput?
    weak var output: ViewErrorPresenterOutput?

    // MARK: - Init
    init(interactor: ViewErrorInteractorInput, coordinator: ViewErrorCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension ViewErrorPresenter: ViewErrorPresenterInput {
    func viewCreated() {

    }

    func handle(_ action: ViewError.Action) {
        switch action {
        case .doLoad:
            interactor.perform(ViewError.Request.LoadStuff())
        case .tokenExpired:
            coordinator?.navigate(to: .goToLogin)
        }
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension ViewErrorPresenter: ViewErrorInteractorOutput {
    func present(_ response: ViewError.Response.StuffResponse) {
        output?.display(ViewError.DisplayData.Error())
    }
}

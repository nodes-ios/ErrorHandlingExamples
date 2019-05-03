//
//  ErrorListPresenter.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import Foundation

class ErrorListPresenter {
    // MARK: - Properties
    let interactor: ErrorListInteractorInput
    weak var coordinator: ErrorListCoordinatorInput?
    weak var output: ErrorListPresenterOutput?
    
    var data: [String] = ["Hello 1", "Hello 2", "Hello 3"]

    // MARK: - Init
    init(interactor: ErrorListInteractorInput, coordinator: ErrorListCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension ErrorListPresenter: ErrorListPresenterInput {
    var numberOfRows: Int {
        return data.count
    }
    
    func configure(_ cell: ErrorCell, at row: Int) {
          cell.textLabel?.text = data[row]
    }
    
    func viewCreated() {
        reloadView()
    }

    func handle(_ action: ErrorList.Action) {
        switch action {
        case .data:
            data += ["Hello 1", "Hello 2", "Hello 3"]
        case .empty:
            data = []
        }
        reloadView()
    }
    
    private func reloadView() {
        let state: ErrorListViewController.State = data.isEmpty ? .noData : .standard
        output?.display(ErrorList.DisplayData.Reload(state: state))
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension ErrorListPresenter: ErrorListInteractorOutput {

}

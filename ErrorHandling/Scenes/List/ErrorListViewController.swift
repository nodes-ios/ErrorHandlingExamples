//
//  ErrorListViewController.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import UIKit

class ErrorListViewController: UIViewController {
    enum State {
        case standard, noData
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ErrorCell")
        }
    }
    
    @IBOutlet weak var noContentView: UIView!
    
    // MARK: - Properties
    private var presenter: ErrorListPresenterInput!
    
    private var currentState: State = .standard

    // MARK: - Init
    class func instantiate(with presenter: ErrorListPresenterInput) -> ErrorListViewController {
        let name = "\(ErrorListViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        // swiftlint:disable:next force_cast
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! ErrorListViewController
        vc.presenter = presenter
        return vc
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }

    // MARK: - Callbacks -
    @IBAction func dataPressed(_ sender: Any) {
        presenter.handle(.data)
    }
    
    @IBAction func emptyPressed(_ sender: Any) {
        presenter.handle(.empty)
    }
}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension ErrorListViewController: ErrorListPresenterOutput {
    func display(_ displayModel: ErrorList.DisplayData.Reload) {
        tableView.reloadData()
        tableView.isHidden = displayModel.state == .noData
        noContentView.isHidden = displayModel.state != .noData
    }
    

}

// MARK: - Tableview

extension ErrorListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ErrorCell", for: indexPath)
        presenter.configure(cell, at: indexPath.row)
        return cell
    }
}

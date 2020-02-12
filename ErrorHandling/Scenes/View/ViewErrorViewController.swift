//
//  ViewErrorViewController.swift
//  ErrorHandling
//
//  Created by Nicolai Harbo on 07/02/2020.
//  Copyright (c) 2020 Nodes. All rights reserved.
//

import UIKit

class ViewErrorViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet weak var tryAgainButton: UIButton! {
        didSet {
            tryAgainButton.isHidden = true
            tryAgainButton.setTitle("Try again", for: .normal)
        }
    }
    
    @IBOutlet weak var errorInfoLabel: UILabel! {
        didSet {
            errorInfoLabel.isHidden = true
            errorInfoLabel.text = "The view couldn't load. Please try again"
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
    }
    
    // MARK: - Properties
    private var presenter: ViewErrorPresenterInput!

    // MARK: - Init
    class func instantiate(with presenter: ViewErrorPresenterInput) -> ViewErrorViewController {
        let name = "\(ViewErrorViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        // swiftlint:disable:next force_cast
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! ViewErrorViewController
        vc.presenter = presenter
        return vc
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doLoad()
    }

    // MARK: - Callbacks -
    @IBAction func tryAginButtonTapped(_ sender: Any) {
        doLoad()
        showTokenExpiredAlert()
    }
    
    // MARK: - Helpers -
    
    private func doLoad() {
        activityIndicator.isHidden = false
        errorInfoLabel.isHidden = true
        tryAgainButton.isHidden = true
        presenter.handle(.doLoad)
    }
    
    private func presentRetryElements() {
        self.activityIndicator.isHidden = true
        self.errorInfoLabel.isHidden = false
        self.tryAgainButton.isHidden = false
    }

    private func showTokenExpiredAlert() {
        let alertController = UIAlertController(title: "Token Expired", message: "Login Again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.presenter.handle(.tokenExpired)
        }

        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension ViewErrorViewController: ViewErrorPresenterOutput {
    func display(_ displayModel: ViewError.DisplayData.Error) {
        presentRetryElements()
    }
}

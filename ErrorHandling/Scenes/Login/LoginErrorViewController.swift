//
//  LoginErrorViewController.swift
//  ErrorHandling
//
//  Created by Chris Combs on 03/05/2019.
//  Copyright (c) 2019 Nodes. All rights reserved.
//

import UIKit

class LoginErrorViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    // MARK: - Properties
    private var presenter: LoginErrorPresenterInput!

    // MARK: - Init
    class func instantiate(with presenter: LoginErrorPresenterInput) -> LoginErrorViewController {
        let name = "\(LoginErrorViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        // swiftlint:disable:next force_cast
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! LoginErrorViewController
        vc.presenter = presenter
        return vc
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }

    // MARK: - Callbacks -
    @IBAction func createPressed(_ sender: Any) {
        clearFields()
        presenter.handle(.createUser)
    }
    
    @IBAction func emailPressed(_ sender: Any) {
        clearFields()
        presenter.handle(.invalidEmail)
      
    }
    
    @IBAction func passwordPressed(_ sender: Any) {
        clearFields()
        presenter.handle(.invalidPassword)
        
    }
    
    private func highlight(_ field: UITextField, label: UILabel, text: String) {
        field.layer.borderColor = UIColor.red.cgColor
        field.layer.borderWidth = 1
        label.isHidden = false
        label.text = text
    }
    
    private func clearFields() {
        [emailErrorLabel, passwordErrorLabel].forEach {
            $0!.isHidden = true
            $0!.text = ""
        }
        [emailField, passwordField].forEach {
            $0!.layer.borderColor = UIColor.clear.cgColor
            $0!.layer.borderWidth = 0
        }
    }
}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension LoginErrorViewController: LoginErrorPresenterOutput {
    func display(_ displayModel: LoginError.DisplayData.ValidationError) {
        if let error = displayModel.emailError {
            highlight(emailField, label: emailErrorLabel, text: error)
        }
        if let error = displayModel.passwordError {
            highlight(passwordField, label: passwordErrorLabel, text: error)
        }
    }
}

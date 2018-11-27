//
//  RegisterViewController.swift
//  TodoList
//
//  Created by Achraf TRABELSI on 27/11/2018.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func register(with user: SendUser) {
        viewModel.startRegister(with: user)
    }

    @IBAction func registerButtonDidClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        register(with: SendUser(name: name, email: email, password: password))
    }
}

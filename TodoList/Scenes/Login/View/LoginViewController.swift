//
//  LoginViewController.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 11/19/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewModel.refreshView = { () in
            print("Success Login !")
        }
    }
    
    func login(with user: LoginUser) {
        viewModel.startLogin(with: user)
    }
    
    private func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        login(with: LoginUser(email: email, password: password))
    }
    
    @IBAction func loginButtonDidClicked(_ sender: UIButton) {
        handleLogin()
    }
    
    @IBAction func goToRegisterViewButtonDidClicked(_ sender: UIButton) {
        let registerViewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}

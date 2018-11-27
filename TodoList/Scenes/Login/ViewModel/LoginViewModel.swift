//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 11/19/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var service: APILoginServiceProtocol
    var alertString: String = ""
    
    // Dependency Injection
    init(_ service: APILoginServiceProtocol = APILoginService()) {
        self.service = service
    }
    
    func startLogin(with user: LoginUser) {
        service.login(user: user) { [weak self] (success, user, error) in
            guard let self = self else { return }
            if let _ = error {
                self.alertString = (error?.rawValue)!
                return
            } else {
                self.refreshView?()
            }
        }
    }
    
    func startRegister(with user: SendUser) {
        self.service.register(user: user) { (success, user, error) in
            
        }
    }
    
    var refreshView: (()->())?
}

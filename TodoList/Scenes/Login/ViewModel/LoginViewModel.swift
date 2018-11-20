//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 11/19/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var service: APITasksServiceProtocol
    var alertString: String = ""
    
    // Dependency Injection
    init(_ service: APITasksServiceProtocol = APITasksService()) {
        self.service = service
    }
    
    func startLogin(with user: SendUser) {
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
    
    var refreshView: (()->())?
}

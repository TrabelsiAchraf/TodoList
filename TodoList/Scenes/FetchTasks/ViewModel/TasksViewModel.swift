//
//  TasksViewModel.swift
//  TodoApp
//
//  Created by Achraf Trabelsi on 10/29/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

class TasksViewModel {
    
    var service: APITasksServiceProtocol
    var alertString: String = ""
    
    // Dependecy Injection
    init(service: APITasksServiceProtocol) {
        self.service = service
    }
    
    func initFetchTasks() {
        service.fetchTasks { [weak self] (success, tasks, error) in
            guard let self = self else { return }
            if let _ = error {
                self.alertString = (error?.rawValue)!
                return
            } else {
                #warning("TODO: add fetch logic !")
            }
        }
    }
}

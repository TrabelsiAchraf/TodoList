//
//  APITasksService.swift
//  TodoApp
//
//  Created by Achraf Trabelsi on 10/29/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

typealias compeletionClosure = ((_ success: Bool, _ tasks: [Task], _ error: APIServiceError?) -> ())

enum APIServiceError: String, Error {
    case noInternet = "Not Internet Connection !"
    case permessionDenied = "Permession Denied !"
}

protocol APITasksServiceProtocol {
    func fetchTasks(compeletionHandler: @escaping compeletionClosure)
}

class APITasksService: APITasksServiceProtocol {
    func fetchTasks(compeletionHandler: @escaping (Bool, [Task], APIServiceError?) -> ()) {
        let fakeTasks = [Task(id: "1", description: "Call my mom", isDone: false),
                         Task(id: "2", description: "Do my homework", isDone: false)]
        compeletionHandler(true, fakeTasks, nil)
    }
}

//
//  APITasksService.swift
//  TodoApp
//
//  Created by Achraf Trabelsi on 10/29/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

typealias compeletionClosure = ((_ success: Bool, _ tasks: [Task], _ error: APIServiceError?) -> ())
typealias compeletionLoginClosure = ((_ success: Bool, _ user: ReceivedUser, _ error: APIServiceError?) -> ())

enum APIServiceError: String, Error {
    case noInternet = "Not Internet Connection !"
    case permessionDenied = "Permession Denied !"
}

protocol APITasksServiceProtocol {
    func fetchTasks(compeletionHandler: @escaping compeletionClosure)
    func login(user: SendUser, compeletionLoginHandler: @escaping compeletionLoginClosure)
}

class APITasksService: APITasksServiceProtocol {
    func login(user: SendUser, compeletionLoginHandler: @escaping compeletionLoginClosure) {
        let fakeUser = ReceivedUser(email: "trabelsi.achraf@gamil.com", password: "12345", name: "Trabelsi Achraf", urlPicture: "https://pbs.twimg.com/profile_images/765367699912392704/dY7-_hnB_400x400.jpg")
        compeletionLoginHandler(true, fakeUser, nil)
    }
    
    func fetchTasks(compeletionHandler: @escaping (Bool, [Task], APIServiceError?) -> ()) {
        let fakeTasks = [Task(id: "1", description: "Call my mom 1", isDone: false),
                         Task(id: "2", description: "Do my homework 1", isDone: false),
                         Task(id: "3", description: "Call my mom 2", isDone: false),
                         Task(id: "4", description: "Do my homework 2", isDone: false),
                         Task(id: "5", description: "Call my mom 3", isDone: false),
                         Task(id: "6", description: "Do my homework 3", isDone: false)]
        compeletionHandler(true, fakeTasks, nil)
    }
}

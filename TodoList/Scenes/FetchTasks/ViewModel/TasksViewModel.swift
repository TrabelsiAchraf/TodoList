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
    init(service: APITasksServiceProtocol = APITasksService()) {
        self.service = service
    }
    
    func startFetchTasks() {
        service.fetchTasks { [weak self] (success, tasks, error) in
            guard let self = self else { return }
            if let _ = error {
                self.alertString = (error?.rawValue)!
                return
            } else {
                self.handleTasks(tasks)
            }
        }
    }
    
    private func handleTasks(_ tasks: [Task]) {
        var tasksTmp = [TaskCellViewModel]()
        for task in tasks {
            tasksTmp.append(createTaskCellViewModel(task))
        }
        self.cellsViewModel = tasksTmp
    }
    
    private func createTaskCellViewModel(_ task: Task) -> TaskCellViewModel {
        return TaskCellViewModel(title: "-> \(task.description)")
    }
    
    private var cellsViewModel: [TaskCellViewModel] = [TaskCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var numberOfCell: Int {
        return cellsViewModel.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TaskCellViewModel {
        return cellsViewModel[indexPath.row]
    }
    
    var reloadTableView: (()->())?
}

struct TaskCellViewModel {
    let title: String
}

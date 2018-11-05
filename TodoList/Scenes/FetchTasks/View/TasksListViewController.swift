//
//  TasksListViewController.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 10/31/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import UIKit

class TasksListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    static let TableViewCellIdentifier = "TaskTableViewCell"
    
    lazy var viewModel: TasksViewModel = {
        return TasksViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startFetching()
    }
    
    func setupView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: type(of: self).TableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: type(of: self).TableViewCellIdentifier)

        viewModel.reloadTableView = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func startFetching() {
        viewModel.startFetchTasks()
    }
}

//MARK: - UITableViewDataSource
extension TasksListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).TableViewCellIdentifier) as! TaskTableViewCell
        cell.setup(with: viewModel.getCellViewModel(at: indexPath))
        return cell
    }
}

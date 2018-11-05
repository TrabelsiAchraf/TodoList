//
//  TasksViewControllerTests.swift
//  TodoListTests
//
//  Created by Achraf Trabelsi on 11/5/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import XCTest
@testable import TodoList

class TasksViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: TasksListViewController!
    var window: UIWindow!
    
    // MARK: - Test lifeCycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupTasksListViewController()
    }

    override func tearDown() {
        resetTasksListViewController()
        super.tearDown()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Test doubles
    
    class TableViewSpy: UITableView {
        // MARK: - Method call expectations
        var reloadDataCalled = false
        
        //MARK: - Spied methods
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func test_numberOfSectionsInTableView_shouldAlwaysBeOne() {
        // Given
        let tableView = sut.tableView
        // When
        let numberOfSection = sut.numberOfSections(in: tableView!)
        // Then
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func test_numberOfRowsInAnySection_should_equal_toTaskToDisplay() {
        // Given
        let tableView = sut.tableView
        
        // When
        sut.startFetching()
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, sut.viewModel.numberOfCell)
    }
    
    func test_shouldConfigureTableViewCell_toDisplay_task() {
        // Given
        let tableView = sut.tableView
        
        // When
        sut.startFetching()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: indexPath) as! TaskTableViewCell
        
        // Then
        XCTAssertEqual(cell.titleLabel.text, "-> Call my mom 1")
    }
}

// MARK: - Test setup
extension TasksViewControllerTests {
    func setupTasksListViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        sut = TasksListViewController()
        if let window = window {
            window.rootViewController = sut
            window.makeKeyAndVisible()
        }
    }
    
    func resetTasksListViewController() {
        window = nil
    }
}

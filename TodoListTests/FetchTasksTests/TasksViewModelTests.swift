//
//  TasksViewModelTests.swift
//  TodoAppTests
//
//  Created by Achraf Trabelsi on 10/29/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import XCTest
@testable import TodoApp

class TasksViewModelTests: XCTestCase {
    
    //MARK: - Subject Under Test
    var sut: TasksViewModel!
    var mockAPITasksService: MockAPITasksService!
    
    override func setUp() {
        super.setUp()
        setupTasksViewModel()
    }
    
    override func tearDown() {
        resetTasksViewModel()
        super.tearDown()
    }
    
    func test_viewModelShouldAskServiceForFetchTasks() {
        // When
        sut.initFetchTasks()
        // Then
        XCTAssert(mockAPITasksService.fetchTaksMethodIsCalled)
    }
    
    func test_viewModelShouldReturnErrorAlertMessageIfFetchingTasksFail() {
        // Given
        let error = APIServiceError.noInternet
        
        // When
        sut.initFetchTasks()
        mockAPITasksService.fetchFail(error: error)
        
        // Then
        XCTAssertEqual(sut.alertString, error.rawValue)
    }
}

//MARK: - Helper
extension TasksViewModelTests {
    func setupTasksViewModel() {
        mockAPITasksService = MockAPITasksService()
        sut = TasksViewModel(service: mockAPITasksService)
    }
    
    func resetTasksViewModel() {
        mockAPITasksService = nil
        sut = nil
    }
}

//MARK: - Mocking APITasksServiceProtocol
class MockAPITasksService: APITasksServiceProtocol {
    
    var compeletion: ((Bool, [Task], APIServiceError?) -> ())!
    
    var fetchTaksMethodIsCalled = false
    
    func fetchTasks(compeletionHandler: @escaping compeletionClosure) {
        fetchTaksMethodIsCalled = true
        compeletion = compeletionHandler
    }
    
    func fetchFail(error: APIServiceError?) {
        compeletion(false, [Task](), error)
    }
}

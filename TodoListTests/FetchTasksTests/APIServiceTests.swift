//
//  APIServiceTests.swift
//  TodoAppTests
//
//  Created by Achraf Trabelsi on 10/29/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import XCTest
@testable import TodoList

class APIServiceTests: XCTestCase {

    //MARK: - Subject Under Test
    var sut: APITasksService!
    
    var testTasks: [Task]!
    
    override func setUp() {
        setupAPITasksService()
        super.setUp()
    }

    override func tearDown() {
        resetAPITasksService()
        super.tearDown()
    }
    
    func test_fetchTasksServiceShouldReturnTasks() {
        // When
        var errorAPI: APIServiceError? = nil
        var fetchedTasks = [Task]()
        let expect = expectation(description: "waith for fetchTasks method to return tasks")
        sut.fetchTasks { (success, tasks, error) in
            errorAPI = error
            fetchedTasks = tasks
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedTasks.count, testTasks.count)
        
        for task in fetchedTasks {
            XCTAssertNotNil(task.id)
        }
        
        XCTAssertNil(errorAPI)
    }
}

//MARK: - Helper
extension APIServiceTests {
    func setupAPITasksService() {
        sut = APITasksService()
        testTasks = StubTasks.generateTasks()
    }
    
    func resetAPITasksService() {
        sut = nil
        testTasks = []
    }
}

//MARK: - Stub
class StubTasks {
    static func generateTasks() -> [Task] {
        return [Task(id: "1", description: "Call my mom 1", isDone: false),
                Task(id: "2", description: "Do my homework 1", isDone: false),
                Task(id: "3", description: "Call my mom 2", isDone: false),
                Task(id: "4", description: "Do my homework 2", isDone: false),
                Task(id: "5", description: "Call my mom 3", isDone: false),
                Task(id: "6", description: "Do my homework 3", isDone: false)]
    }
}

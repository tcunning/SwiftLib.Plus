import XCTest
@testable import SwiftLib_Plus

final class SwiftLib_PlusTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftLib_Plus().text, "Hello, World!")
    }

    func testLock() {
        let taskAExpectation = XCTestExpectation(description: "TaskA")
        let taskBExpectation = XCTestExpectation(description: "TaskB")
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.lock(self) {
                for index in 0...10 {
                    print("Task A: \(index)")
                }
            }
            
            taskAExpectation.fulfill()
        }

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            DispatchQueue.lock(self) {
                for index in 0...10 {
                    print("Task B: \(index)")
                }
                taskAExpectation.fulfill()
            }

            taskBExpectation.fulfill()
        }
        wait(for: [taskAExpectation, taskBExpectation], timeout: 1.0)
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}

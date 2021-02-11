import XCTest
@testable import SwiftLib_Plus

final class LockTests: XCTestCase {
    
    func testLockPerformance() {
        _ = performanceTimer() {
            for _ in 1...100000 {
                DispatchQueue.lock(self) {
                    /* no op */
                }
            }
        }
    }
    
    func testLockForStruct() {
        struct TestLocker {
        }
        
        let testLocker = TestLocker();
        lockHelper(locker: testLocker)
    }
    
    func testLockForInt() {
        let testLocker = 10;
        lockHelper(locker: testLocker)
    }
    
    func testLockForArray() {
        let testLocker = [10, 20];
        lockHelper(locker: testLocker)
    }
    
    func testLock() {
        lockHelper(locker: self)
    }
    
    func lockHelper(locker: Any) {
        let taskAExpectation = XCTestExpectation(description: "TaskA")
        let taskBExpectation = XCTestExpectation(description: "TaskB")
        
        var countA = 0
        var countB = 0
        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.lock(locker) {
                let isMain = countA == 0 && countB == 0
                
                for _ in 1...10 {
                    countA += 1
                    if isMain {
                        XCTAssertTrue(countB == 0)
                    } else {
                        XCTAssertTrue(countB == 10)
                    }
                }
            }
            
            taskAExpectation.fulfill()
        }

        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.lock(locker) {
                let isMain = countA == 0 && countB == 0

                for _ in 1...10 {
                    countB += 1
                    if isMain {
                        XCTAssertTrue(countA == 0)
                    } else {
                        XCTAssertTrue(countA == 10)
                    }
                }
                taskAExpectation.fulfill()
            }

            taskBExpectation.fulfill()
        }
        wait(for: [taskAExpectation, taskBExpectation], timeout: 1.0)
    }

    
    //static var allTests = [
    //    ("testExample", testExample),
    //]
}

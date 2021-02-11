import XCTest
@testable import SwiftLib_Plus

final class ExampleTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftLib_Plus().text, "Hello, World!")
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}

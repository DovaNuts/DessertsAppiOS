import XCTest

extension XCTestCase {
    func waitAndValidate(expectation: XCTestExpectation, waitTime: TimeInterval = 0.4, validate: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            validate()
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: waitTime + 1)
    }
}

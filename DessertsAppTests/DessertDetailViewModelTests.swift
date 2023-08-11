import Combine
import XCTest
@testable import DessertsApp

class DessertDetailViewModelTests: XCTestCase {

    func testFetchDessertDetailSuccess() {
        let mockNetworkManager = MockNetworkManager()
        let subject = DessertDetailViewModel(id: "1", networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch dessert detail successfully")

        waitAndValidate(expectation: expectation) {
            XCTAssertEqual(subject.state, .loaded)
            XCTAssertNotNil(subject.dessert)
        }
    }

    func testFetchDessertDetailFailure() {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldError = true
        let subject = DessertDetailViewModel(id: "", networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch dessert detail failed")

        waitAndValidate(expectation: expectation) {
            XCTAssertEqual(subject.state, .failed)
            XCTAssertNil(subject.dessert)
        }
    }

    func testFetchDessertDetailWithNonExistingID() {
        let mockNetworkManager = MockNetworkManager()
        let subject = DessertDetailViewModel(id: "9999", networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch dessert detail non existing id")

        waitAndValidate(expectation: expectation) {
            XCTAssertEqual(subject.state, .failed)
            XCTAssertNil(subject.dessert)
        }
    }
}

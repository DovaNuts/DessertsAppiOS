import Combine
import XCTest
@testable import DessertsApp

class DessertListViewModelTests: XCTestCase {

    func testFetchDessertsSuccess() {
        let mockNetworkManager = MockNetworkManager()
        let subject = DessertListViewModel(networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch desserts successfully")

        waitAndValidate(expectation: expectation) {
            XCTAssertEqual(subject.state, .loaded)
            XCTAssertEqual(subject.desserts.count, 2)
        }
    }

    func testFetchDessertsFailure() {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldError = true
        let subject = DessertListViewModel(networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch desserts failed")

        waitAndValidate(expectation: expectation) {
            XCTAssertEqual(subject.state, .failed)
            XCTAssertEqual(subject.desserts.count, 0)
        }
    }

    func testSearchResults() {
        let mockNetworkManager = MockNetworkManager()
        let subject = DessertListViewModel(networkManager: mockNetworkManager)
        let expectation = XCTestExpectation(description: "Fetch desserts and filter")

        waitAndValidate(expectation: expectation) {
            subject.searchText = "Pie"
            XCTAssertEqual(subject.searchResults.count, 1)

            subject.searchText = "Brownie"
            XCTAssertEqual(subject.searchResults.count, 0)

            subject.searchText = ""
            XCTAssertEqual(subject.searchResults.count, 2)
        }
    }
}

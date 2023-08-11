import XCTest
@testable import DessertsApp

class URLImageFetcherTests: XCTestCase {
    func testFetchImage() {
        let testImageURL = "https://i.imgur.com/CzXTtJV.jpg"
        let subject = URLImageFetcher(urlString: testImageURL)
        let expectation = XCTestExpectation(description: "Fetch image")

        waitAndValidate(expectation: expectation, waitTime: 4) {
            XCTAssertNotNil(subject.image)
        }
    }

    func testFetchImageWithInvalidURL() {
        let testImageURL = ""
        let subject = URLImageFetcher(urlString: testImageURL)
        let expectation = XCTestExpectation(description: "Fetch image invalid url")

        waitAndValidate(expectation: expectation, waitTime: 4) {
            XCTAssertNil(subject.image)
        }
    }
}

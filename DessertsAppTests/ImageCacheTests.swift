import XCTest
@testable import DessertsApp

class ImageCacheTests: XCTestCase {
    func testGetImageFromCache() {
        ImageCache.shared.set(UIImage(named: "placeholder")!, forKey: "test")
        XCTAssertNotNil(ImageCache.shared.get(forKey: "test"))
        ImageCache.shared.remove(forKey: "test")
    }

    func testGetNotExistingImageFromCache() {
        XCTAssertNil(ImageCache.shared.get(forKey: "test"))
    }
}

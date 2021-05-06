//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import XCTest
@testable import BoxOfficeBuzz

class TimeIntervalFormattedDurationTests: XCTestCase {

    func testFormattedDuration() throws {
        XCTAssertEqual(TimeInterval(0 * 60).formattedDuration(), "0m")
        XCTAssertEqual(TimeInterval(30 * 60).formattedDuration(), "30m")
        XCTAssertEqual(TimeInterval(60 * 60).formattedDuration(), "1h 0m")
        XCTAssertEqual(TimeInterval(121 * 60).formattedDuration(), "2h 1m")
    }

}

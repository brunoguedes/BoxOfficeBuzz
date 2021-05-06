//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import XCTest
import Swifter

// swiftlint:disable type_name line_length unused_closure_parameter
class BoxOfficeBuzzUITests: XCTestCase {

    let server = HttpServer()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        server["/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined"] = responseFor(jsonFileName: "now_playing_movies")
        server["/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1"] = popularResponse()
        server["/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=2"] = popularResponse()
        server["/399566?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US"] = responseFor(jsonFileName: "movie_details_godzilla_vs_kong")
        server["/634528?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US"] = responseFor(jsonFileName: "movie_details_the_marksman")
        server["/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg"] = responseFor(imageFileName: "lPsD10PP4rgUGiGR4CCXA6iY0QQ")
        server["/6K0RCDfP9ExbTcYgryaQHTGmET7.jpg"] = responseFor(imageFileName: "6K0RCDfP9ExbTcYgryaQHTGmET7")
        server["/6vcDalR50RWa309vBH1NLmG2rjQ.jpg"] = responseFor(imageFileName: "6vcDalR50RWa309vBH1NLmG2rjQ")
        server["/9kg73Mg8WJKlB9Y2SAJzeDKAnuB.jpg"] = responseFor(imageFileName: "9kg73Mg8WJKlB9Y2SAJzeDKAnuB")
        server["/duK11VQd4UPDa7UJrgrGx90xJOx.jpg"] = responseFor(imageFileName: "duK11VQd4UPDa7UJrgrGx90xJOx")
        server["/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg"] = responseFor(imageFileName: "pgqgaUx1cJb5oZQQ5v0tNARCeBp")
        do {
            try server.start(3001, priority: .userInteractive)
        } catch {
            print("🚨 - Unable to start the local server")
        }
    }

    override func tearDown() {
        server.stop()
    }

    func testApp() {
        // UI tests must launch the application that they test.
        let app = launchAppLocalHost()
        checkNowPlaying(app)
        checkMostPopular(app)
        checkNowPlayingItemDetails(app)
    }

    func checkNowPlaying(_ app: XCUIApplication) {
        XCTAssert(app.staticTexts["Playing now"].exists)
        let collectionViewCells = app.collectionViews.firstMatch.cells
        let nowPlayingItems = [
            "Now Playing: Godzilla vs. Kong",
            "Now Playing: Mortal Kombat",
            "Now Playing: The Marksman",
            "Now Playing: Chaos Walking"
        ]
        for item in nowPlayingItems {
            XCTAssert(collectionViewCells.element(matching: .cell, identifier: item).exists)
        }
    }

    func checkMostPopular(_ app: XCUIApplication) {
        XCTAssert(app.staticTexts["Most popular"].exists)
        let tableViewCells = app.tables.firstMatch.cells
        let mostPopularItems = [
            "Mortal Kombat. Released on Apr 07, 2021. Rated 79%.",
            "Godzilla vs. Kong. Released on Mar 24, 2021. Rated 82%.",
            "Nobody. Released on Mar 18, 2021. Rated 85%.",
            "Zack Snyder's Justice League. Released on Mar 18, 2021. Rated 85%.",
            "The Unholy. Released on Mar 31, 2021. Rated 47%.",
            "Thunder Force. Released on Apr 09, 2021. Rated 48%.",
            "The Marksman. Released on Jan 15, 2021. Rated 73%.",
            "Chaos Walking. Released on Feb 24, 2021. Rated 73%.",
            "Raya and the Last Dragon. Released on Mar 03, 2021. Rated 83%."
        ]
        for item in mostPopularItems {
            XCTAssert(tableViewCells.element(matching: .cell, identifier: item).exists)
        }
    }

    func checkNowPlayingItemDetails(_ app: XCUIApplication) {
        let collectionViewCells = app.collectionViews.firstMatch.cells
        collectionViewCells.element(matching: .cell, identifier: "Now Playing: Godzilla vs. Kong").tap()
        XCTAssert(app.staticTexts["Godzilla vs. Kong"].exists)
        XCTAssert(app.staticTexts["Mar 24, 2021 - 1h 53m"].exists)
        XCTAssert(app.staticTexts["Overview"].exists)
        let overviewPredicate = NSPredicate(format: "label LIKE %@", "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.")
        XCTAssert(app.staticTexts.element(matching: overviewPredicate).exists)
        XCTAssert(app.staticTexts["Science Fiction"].exists)
        XCTAssert(app.staticTexts["Action"].exists)
        app.buttons["Close"].tap()

        let tableViewCells = app.tables.firstMatch.cells
        tableViewCells.element(matching: .cell, identifier: "The Marksman. Released on Jan 15, 2021. Rated 73%.").tap()
        XCTAssert(app.staticTexts["The Marksman"].exists)
        XCTAssert(app.staticTexts["Jan 15, 2021 - 1h 48m"].exists)
        XCTAssert(app.staticTexts["Overview"].exists)
        let overviewPredicate2 = NSPredicate(format: "label LIKE %@", "Jim Hanson’s quiet life is suddenly disturbed by two people crossing the US/Mexico border – a woman and her young son – desperate to flee a Mexican cartel. After a shootout leaves the mother dead, Jim becomes the boy’s reluctant defender. He embraces his role as Miguel’s protector and will stop at nothing to get him to safety, as they go on the run from the relentless assassins.")
        XCTAssert(app.staticTexts.element(matching: overviewPredicate2).exists)
        XCTAssert(app.staticTexts["Thriller"].exists)
        XCTAssert(app.staticTexts["Action"].exists)
        XCTAssert(app.staticTexts["Crime"].exists)
    }

    func testLaunchPerformance() {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric(waitUntilResponsive: true)]) {
            _ = launchAppLocalHost()
        }
    }

    // MARK: - Helpers
    func launchAppLocalHost() -> XCUIApplication {
        var launchEnvironment = [String: String]()
        launchEnvironment["BASE_URL"] = "http://localhost:3001/"
        let app = XCUIApplication()
        app.launchEnvironment = launchEnvironment
        app.launch()
        return app
    }

    func responseFor(jsonFileName: String) -> ((HttpRequest) -> HttpResponse) {
        return { (httpRequest: HttpRequest) -> HttpResponse in
            let path = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json")
            guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
                return .notFound
            }
            return .ok(.data(jsonData, contentType: "application/json"))
        }
    }
    func responseFor(imageFileName: String) -> ((HttpRequest) -> HttpResponse) {
        return { (httpRequest: HttpRequest) -> HttpResponse in
            let path = Bundle(for: type(of: self)).path(forResource: imageFileName, ofType: "jpg")
            guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
                return .notFound
            }
            return .ok(.data(imageData, contentType: "image/jpeg"))
        }
    }
    func popularResponse() -> ((HttpRequest) -> HttpResponse) {
        return { (httpRequest: HttpRequest) -> HttpResponse in
            let path = Bundle(for: type(of: self)).path(forResource: "popular_movies_page_\(httpRequest.queryParams[2].1)", ofType: "json")
            guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
                return .notFound
            }
            return .ok(.data(jsonData, contentType: "application/json"))
        }
    }
}

// swiftlint:enable type_name line_length unused_closure_parameter

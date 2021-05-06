File: BoxOfficeBuzzUITests/BoxOfficeBuzzUITests.swift

# BoxOfficeBuzzUITests
## Summary
BoxOfficeBuzzUITests is a test class that provides UI tests for an application. It sets up a local server to mock API responses and tests the application's UI components and their interactions.

## Instance Variables
- `server`: `HttpServer` - an instance of `HttpServer` used to mock API responses.

## Methods
- `func setUp() -> Void`: Sets up the test environment by configuring the local server to respond to API requests.
- `func tearDown() -> Void`: Tears down the test environment by stopping the local server.
- `func testApp() -> Void`: Launches the application and performs UI tests on its main components.
- `func checkNowPlaying(app: XCUIApplication) -> Void`: Verifies the existence of now playing items in the application.
- `func checkMostPopular(app: XCUIApplication) -> Void`: Verifies the existence of most popular items in the application.
- `func checkNowPlayingItemDetails(app: XCUIApplication) -> Void`: Verifies the details of now playing items in the application.
- `func testLaunchPerformance() -> Void`: Measures the launch performance of the application.
- `func launchAppLocalHost() -> XCUIApplication`: Launches the application with a local host environment.
- `func responseFor(jsonFileName: String) -> ((HttpRequest) -> HttpResponse)`: Returns a response handler for JSON files.
- `func responseFor(imageFileName: String) -> ((HttpRequest) -> HttpResponse)`: Returns a response handler for image files.
- `func popularResponse() -> ((HttpRequest) -> HttpResponse)`: Returns a response handler for popular movies.

## Dependencies
- `XCUIApplication`: Used to interact with the application under test.
- `((HttpRequest) -> HttpResponse)`: Used as a response handler for the local server.


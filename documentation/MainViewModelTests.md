File: BoxOfficeBuzzTests/MainViewModelTests.swift

# MainViewModelTests

## Summary
MainViewModelTests is a test class that tests the functionality of the MainViewModel. It sets up mock services and view models, and then tests various scenarios to ensure that the view model behaves as expected.

## Instance Variables
- `popularMovieMockService: MovieService!` - A mock service for popular movies.
- `nowPlayigMovieMockService: MovieService!` - A mock service for now playing movies.
- `movieDetailsMovieMockService: MovieService!` - A mock service for movie details.
- `mainViewModel: MainViewModel!` - The main view model being tested.
- `expectation1: XCTestExpectation!` - An expectation for testing asynchronous code.
- `expectation2: XCTestExpectation!` - Another expectation for testing asynchronous code.
- `cancellables: Set<AnyCancellable>` - A set of cancellable subscriptions.

## Methods
- `func setUpWithError() -> Void` - Sets up the mock services and view model before each test.
- `func tearDownWithError() -> Void` - Tears down the mock services and view model after each test.
- `func testFetchAll() -> Void` - Tests that the view model can fetch all data correctly.
- `func testFetchPopularMovies() -> Void` - Tests that the view model can fetch popular movies correctly.
- `func testFetchNowPlayingMovies() -> Void` - Tests that the view model can fetch now playing movies correctly.
- `func testFetchMovieDetails() -> Void` - Tests that the view model can fetch movie details correctly.

## Dependencies
- `XCTestExpectation!` - A class for testing asynchronous code.
- `MovieService!` - A service for fetching movie data.
- `MainViewModel!` - The main view model being tested.


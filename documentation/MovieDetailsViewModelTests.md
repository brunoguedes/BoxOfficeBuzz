File: BoxOfficeBuzzTests/MovieDetailsViewModelTests.swift

# MovieDetailsViewModelTests
## Summary
`MovieDetailsViewModelTests` is a test class that contains test cases for `MovieDetailsViewModel`. It provides a way to verify the correctness of `MovieDetailsViewModel` properties.

## Methods
- ### `testMovieDatailsViewModelProperties() -> Void`
  Tests the properties of `MovieDetailsViewModel` with a `MovieDetails` object that has a duration.
  ```swift
  func testMovieDatailsViewModelProperties() {
      let movieDetails = MovieDetails(
          movieId: 123,
          title: "1st Movie",
          duration: TimeInterval(113 * 60),
          posterPath: "poster_1.jpg",
          releaseDate: DateFormatter.yyyyMMdd.date(from: "2021-06-18")!,
          overview: "This is an amazing movie!",
          genres: ["coding", "challenge"])
      let viewModel = MovieDetailsViewModel(movieDetails: movieDetails)
      XCTAssertEqual(viewModel.title, "1st Movie")
      XCTAssertEqual(viewModel.subtitle, "Jun 18, 2021 - 1h 53m")
      XCTAssertEqual(viewModel.posterImageURL?.absoluteString, "https://image.tmdb.org/t/p/w500/poster_1.jpg")
      XCTAssertEqual(viewModel.overview, "This is an amazing movie!")
      XCTAssertEqual(viewModel.genres, ["coding", "challenge"])
  }
  ```
- ### `testMovieDatailsViewModelPropertiesNoDuration() -> Void`
  Tests the properties of `MovieDetailsViewModel` with a `MovieDetails` object that has no duration.
  ```swift
  func testMovieDatailsViewModelPropertiesNoDuration() {
      let movieDetails = MovieDetails(
          movieId: 123,
          title: "1st Movie",
          duration: nil,
          posterPath: "poster_1.jpg",
          releaseDate: DateFormatter.yyyyMMdd.date(from: "2021-06-18")!,
          overview: "This is an amazing movie!",
          genres: ["coding", "challenge"])
      let viewModel = MovieDetailsViewModel(movieDetails: movieDetails)
      XCTAssertEqual(viewModel.title, "1st Movie")
      XCTAssertEqual(viewModel.subtitle, "Jun 18, 2021")
      XCTAssertEqual(viewModel.posterImageURL?.absoluteString, "https://image.tmdb.org/t/p/w500/poster_1.jpg")
      XCTAssertEqual(viewModel.overview, "This is an amazing movie!")
      XCTAssertEqual(viewModel.genres, ["coding", "challenge"])
  }
  ```


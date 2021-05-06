//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import XCTest

@testable import BoxOfficeBuzz
// swiftlint:disable line_length
class MovieCellViewModelTests: XCTestCase {

    func testGoodMovieViewModelProperties() {
        let movie1 = Movie(
            movieId: 123,
            title: "1st Movie",
            rating: 5.0,
            posterPath: "poster_1.jpg",
            releaseDate: DateFormatter.yyyyMMdd.date(from: "2021-06-18")!,
            duration: 100 * 60)
        let viewModel1 = MovieCellViewModel(movie: movie1)
        XCTAssertEqual(viewModel1.title, "1st Movie", "View Model title is not correct")
        XCTAssertEqual(viewModel1.rating, 50, "View Model rating is not correct")
        XCTAssertEqual(viewModel1.ratingColor, .ratingViewGood, "View Model rating color is not correct")
        XCTAssertEqual(viewModel1.ratingBackgroundColor, .ratingViewGoodBackground, "View Model rating color is not correct")
        XCTAssertEqual(viewModel1.posterImageURL?.absoluteString, "https://image.tmdb.org/t/p/w500/poster_1.jpg", "View Model poster url is not correct")
        XCTAssertEqual(viewModel1.releaseDate, "Jun 18, 2021", "View Model title is not correct")
        XCTAssertEqual(viewModel1.durationFormatted, "1h 40m", "View Model duration is not correct")
    }

    func testBadMovieViewModelProperties() {
        let movie1 = Movie(
            movieId: 123,
            title: "1st Movie",
            rating: 4.9,
            posterPath: "poster_1.jpg",
            releaseDate: DateFormatter.yyyyMMdd.date(from: "2021-06-18")!,
            duration: nil)
        let viewModel1 = MovieCellViewModel(movie: movie1)
        XCTAssertEqual(viewModel1.title, "1st Movie", "View Model title is not correct")
        XCTAssertEqual(viewModel1.rating, 49, "View Model rating is not correct")
        XCTAssertEqual(viewModel1.ratingColor, .ratingViewBad, "View Model rating color is not correct")
        XCTAssertEqual(viewModel1.ratingBackgroundColor, .ratingViewBadBackground, "View Model rating color is not correct")
        XCTAssertEqual(viewModel1.posterImageURL?.absoluteString, "https://image.tmdb.org/t/p/w500/poster_1.jpg", "View Model poster url is not correct")
        XCTAssertEqual(viewModel1.releaseDate, "Jun 18, 2021", "View Model title is not correct")
    }

}
// swiftlint:enable line_length

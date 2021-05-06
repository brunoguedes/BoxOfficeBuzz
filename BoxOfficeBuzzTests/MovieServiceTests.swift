//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import XCTest
@testable import BoxOfficeBuzz
// swiftlint:disable line_length

class MovieServiceTests: XCTestCase {

    func testGetNowPlayingMovies() throws {
        let mockApiService = MockApiService()
        mockApiService.mockResponses = [.nowPlayingMovies]
        let expectation = XCTestExpectation(description: "Call API")
        MovieService(apiService: mockApiService).fetchNowPlayingMovies { result in
            XCTAssertEqual(mockApiService.latestCallInfo?.httpMethod, .get)
            XCTAssertEqual(mockApiService.latestCallInfo?.endpointCalled, "now_playing")
            XCTAssertEqual(mockApiService.latestCallInfo?.queryParameters, "language=en-US&page=undefined")
            switch result {
            case .success(let movies):
                XCTAssertEqual(movies.count, 5)

                XCTAssertEqual(movies[0].movieId, 399566)
                XCTAssertEqual(movies[0].title, "Godzilla vs. Kong")
                XCTAssertEqual(movies[0].posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
                XCTAssertEqual(movies[0].rating, 8.3)

                XCTAssertEqual(movies[1].movieId, 460465)
                XCTAssertEqual(movies[1].title, "Mortal Kombat")
                XCTAssertEqual(movies[1].posterPath, "6K0RCDfP9ExbTcYgryaQHTGmET7.jpg")
                XCTAssertEqual(movies[1].rating, 8.2)

                XCTAssertEqual(movies[2].movieId, 634528)
                XCTAssertEqual(movies[2].title, "The Marksman")
                XCTAssertEqual(movies[2].posterPath, "6vcDalR50RWa309vBH1NLmG2rjQ.jpg")
                XCTAssertEqual(movies[2].rating, 7.1)

                XCTAssertEqual(movies[3].movieId, 412656)
                XCTAssertEqual(movies[3].title, "Chaos Walking")
                XCTAssertEqual(movies[3].posterPath, "9kg73Mg8WJKlB9Y2SAJzeDKAnuB.jpg")
                XCTAssertEqual(movies[3].rating, 4.4)

                XCTAssertEqual(movies[4].movieId, 615457)
                XCTAssertEqual(movies[4].title, "Nobody")
                XCTAssertNil(movies[4].posterPath)
                XCTAssertEqual(movies[4].rating, 10)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testGetPopularMovies() throws {
        let mockApiService = MockApiService()
        mockApiService.mockResponses = [.popularMoviesPage1]
        let expectation = XCTestExpectation(description: "Call API")
        MovieService(apiService: mockApiService).fetchPopularMovies(page: 1) { result in
            XCTAssertEqual(mockApiService.latestCallInfo?.httpMethod, .get)
            XCTAssertEqual(mockApiService.latestCallInfo?.endpointCalled, "popular")
            XCTAssertEqual(mockApiService.latestCallInfo?.queryParameters, "language=en-US&page=1")
            switch result {
            case .success(let paginatedMovies):
                XCTAssertEqual(paginatedMovies.results.count, 5)

                XCTAssertEqual(paginatedMovies.results[0].movieId, 460465)
                XCTAssertEqual(paginatedMovies.results[0].title, "Mortal Kombat")
                XCTAssertEqual(paginatedMovies.results[0].posterPath, "6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg")
                XCTAssertEqual(paginatedMovies.results[0].rating, 7.9)

                XCTAssertEqual(paginatedMovies.results[1].movieId, 399566)
                XCTAssertEqual(paginatedMovies.results[1].title, "Godzilla vs. Kong")
                XCTAssertEqual(paginatedMovies.results[1].posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
                XCTAssertEqual(paginatedMovies.results[1].rating, 8.2)

                XCTAssertEqual(paginatedMovies.results[2].movieId, 615457)
                XCTAssertEqual(paginatedMovies.results[2].title, "Nobody")
                XCTAssertEqual(paginatedMovies.results[2].posterPath, "oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")
                XCTAssertEqual(paginatedMovies.results[2].rating, 8.5)

                XCTAssertEqual(paginatedMovies.results[3].movieId, 791373)
                XCTAssertEqual(paginatedMovies.results[3].title, "Zack Snyder's Justice League")
                XCTAssertEqual(paginatedMovies.results[3].posterPath, "tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg")
                XCTAssertEqual(paginatedMovies.results[3].rating, 8.5)

                XCTAssertEqual(paginatedMovies.results[4].movieId, 632357)
                XCTAssertEqual(paginatedMovies.results[4].title, "The Unholy")
                XCTAssertEqual(paginatedMovies.results[4].posterPath, "b4gYVcl8pParX8AjkN90iQrWrWO.jpg")
                XCTAssertEqual(paginatedMovies.results[4].rating, 4.7)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testGetMovieDetails() throws {
        let mockApiService = MockApiService()
        mockApiService.mockResponses = [.movieDetailsGodzilla]
        let expectation = XCTestExpectation(description: "Call API")
        MovieService(apiService: mockApiService).fetchMovieDetails(movieId: 399566) { result in
            XCTAssertEqual(mockApiService.latestCallInfo?.httpMethod, .get)
            XCTAssertEqual(mockApiService.latestCallInfo?.endpointCalled, "399566")
            XCTAssertEqual(mockApiService.latestCallInfo?.queryParameters, "language=en-US")
            switch result {
            case .success(let movieDetails):
                XCTAssertEqual(movieDetails.movieId, 399566)
                XCTAssertEqual(movieDetails.title, "Godzilla vs. Kong")
                XCTAssertEqual(movieDetails.posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
                XCTAssertEqual(movieDetails.duration, TimeInterval(113 * 60))
                XCTAssertEqual(movieDetails.releaseDate, DateFormatter.yyyyMMdd.date(from: "2021-03-24"))
                XCTAssertEqual(movieDetails.overview, "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.")
                XCTAssertEqual(movieDetails.genres, ["Science Fiction", "Action"])
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

}
// swiftlint:enable line_length

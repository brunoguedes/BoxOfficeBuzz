//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import XCTest
import Combine
@testable import BoxOfficeBuzz

// swiftlint:disable line_length function_body_length
class MainViewModelTests: XCTestCase {

    var popularMovieMockService: MovieService!
    var nowPlayigMovieMockService: MovieService!
    var movieDetailsMovieMockService: MovieService!
    var mainViewModel: MainViewModel!
    var expectation1: XCTestExpectation!
    var expectation2: XCTestExpectation!

    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        let popularMovieMockApiService = MockApiService()
        popularMovieMockApiService.mockResponses = [.popularMoviesPage1, .popularMoviesPage2]
        popularMovieMockService = MovieService(apiService: popularMovieMockApiService)

        let nowPlayigMovieMockApiService = MockApiService()
        nowPlayigMovieMockApiService.mockResponses = [.nowPlayingMovies]
        nowPlayigMovieMockService = MovieService(apiService: nowPlayigMovieMockApiService)

        let movieDetailsMovieMockApiService = MockApiService()
        movieDetailsMovieMockApiService.mockResponses = [.movieDetailsGodzilla]
        movieDetailsMovieMockService = MovieService(apiService: movieDetailsMovieMockApiService)

        mainViewModel = MainViewModel(nowPlayigMovieService: nowPlayigMovieMockService, popularsMovieService: popularMovieMockService, movieDetailsService: movieDetailsMovieMockService)

        expectation1 = XCTestExpectation(description: "Call API")
        expectation2 = XCTestExpectation(description: "Call 2nd API")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAll() throws {
        mainViewModel.nowPlayigMoviesSubject.dropFirst().sink { [weak self] movies in
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
            self?.expectation1.fulfill()
        }
        .store(in: &cancellables)

        mainViewModel.popularMoviesSubject.dropFirst().sink { [weak self] movies in
            XCTAssertEqual(movies.count, 5)

            XCTAssertEqual(movies[0].movieId, 460465)
            XCTAssertEqual(movies[0].title, "Mortal Kombat")
            XCTAssertEqual(movies[0].posterPath, "6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg")
            XCTAssertEqual(movies[0].rating, 7.9)

            XCTAssertEqual(movies[1].movieId, 399566)
            XCTAssertEqual(movies[1].title, "Godzilla vs. Kong")
            XCTAssertEqual(movies[1].posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
            XCTAssertEqual(movies[1].rating, 8.2)

            XCTAssertEqual(movies[2].movieId, 615457)
            XCTAssertEqual(movies[2].title, "Nobody")
            XCTAssertEqual(movies[2].posterPath, "oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")
            XCTAssertEqual(movies[2].rating, 8.5)

            XCTAssertEqual(movies[3].movieId, 791373)
            XCTAssertEqual(movies[3].title, "Zack Snyder's Justice League")
            XCTAssertEqual(movies[3].posterPath, "tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg")
            XCTAssertEqual(movies[3].rating, 8.5)

            XCTAssertEqual(movies[4].movieId, 632357)
            XCTAssertEqual(movies[4].title, "The Unholy")
            XCTAssertEqual(movies[4].posterPath, "b4gYVcl8pParX8AjkN90iQrWrWO.jpg")
            XCTAssertEqual(movies[4].rating, 4.7)
            self?.expectation2.fulfill()
        }
        .store(in: &cancellables)
        mainViewModel.fetchAllData()
        wait(for: [expectation1, expectation2], timeout: 1)
    }

    func testFetchPopularMovies() throws {
        var page = 1
        mainViewModel.popularMoviesSubject.dropFirst().sink { [weak self] movies in
            if page == 1 {
                page = 2
                XCTAssertEqual(movies.count, 5)

                XCTAssertEqual(movies[0].movieId, 460465)
                XCTAssertEqual(movies[0].title, "Mortal Kombat")
                XCTAssertEqual(movies[0].posterPath, "6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg")
                XCTAssertEqual(movies[0].rating, 7.9)

                XCTAssertEqual(movies[1].movieId, 399566)
                XCTAssertEqual(movies[1].title, "Godzilla vs. Kong")
                XCTAssertEqual(movies[1].posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
                XCTAssertEqual(movies[1].rating, 8.2)

                XCTAssertEqual(movies[2].movieId, 615457)
                XCTAssertEqual(movies[2].title, "Nobody")
                XCTAssertEqual(movies[2].posterPath, "oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")
                XCTAssertEqual(movies[2].rating, 8.5)

                XCTAssertEqual(movies[3].movieId, 791373)
                XCTAssertEqual(movies[3].title, "Zack Snyder's Justice League")
                XCTAssertEqual(movies[3].posterPath, "tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg")
                XCTAssertEqual(movies[3].rating, 8.5)

                XCTAssertEqual(movies[4].movieId, 632357)
                XCTAssertEqual(movies[4].title, "The Unholy")
                XCTAssertEqual(movies[4].posterPath, "b4gYVcl8pParX8AjkN90iQrWrWO.jpg")
                XCTAssertEqual(movies[4].rating, 4.7)
                self?.expectation1.fulfill()
                self?.mainViewModel.fetchPopularMovies() // fetch 2nd page
            } else if page == 2 {
                XCTAssertEqual(movies.count, 9)

                XCTAssertEqual(movies[0].movieId, 460465)
                XCTAssertEqual(movies[0].title, "Mortal Kombat")
                XCTAssertEqual(movies[0].posterPath, "6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg")
                XCTAssertEqual(movies[0].rating, 7.9)

                XCTAssertEqual(movies[1].movieId, 399566)
                XCTAssertEqual(movies[1].title, "Godzilla vs. Kong")
                XCTAssertEqual(movies[1].posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
                XCTAssertEqual(movies[1].rating, 8.2)

                XCTAssertEqual(movies[2].movieId, 615457)
                XCTAssertEqual(movies[2].title, "Nobody")
                XCTAssertEqual(movies[2].posterPath, "oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")
                XCTAssertEqual(movies[2].rating, 8.5)

                XCTAssertEqual(movies[3].movieId, 791373)
                XCTAssertEqual(movies[3].title, "Zack Snyder's Justice League")
                XCTAssertEqual(movies[3].posterPath, "tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg")
                XCTAssertEqual(movies[3].rating, 8.5)

                XCTAssertEqual(movies[4].movieId, 632357)
                XCTAssertEqual(movies[4].title, "The Unholy")
                XCTAssertEqual(movies[4].posterPath, "b4gYVcl8pParX8AjkN90iQrWrWO.jpg")
                XCTAssertEqual(movies[4].rating, 4.7)

                XCTAssertEqual(movies[5].movieId, 615678)
                XCTAssertEqual(movies[5].title, "Thunder Force")
                XCTAssertEqual(movies[5].posterPath, "duK11VQd4UPDa7UJrgrGx90xJOx.jpg")
                XCTAssertEqual(movies[5].rating, 4.8)

                XCTAssertEqual(movies[6].movieId, 634528)
                XCTAssertEqual(movies[6].title, "The Marksman")
                XCTAssertEqual(movies[6].posterPath, "6vcDalR50RWa309vBH1NLmG2rjQ.jpg")
                XCTAssertEqual(movies[6].rating, 7.3)

                XCTAssertEqual(movies[7].movieId, 412656)
                XCTAssertEqual(movies[7].title, "Chaos Walking")
                XCTAssertEqual(movies[7].posterPath, "9kg73Mg8WJKlB9Y2SAJzeDKAnuB.jpg")
                XCTAssertEqual(movies[7].rating, 7.3)

                XCTAssertEqual(movies[8].movieId, 527774)
                XCTAssertEqual(movies[8].title, "Raya and the Last Dragon")
                XCTAssertEqual(movies[8].posterPath, "lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg")
                XCTAssertEqual(movies[8].rating, 8.3)
                self?.expectation2.fulfill()
            }
        }
        .store(in: &cancellables)
        mainViewModel.fetchPopularMovies()
        wait(for: [expectation1, expectation2], timeout: 1)
    }

    func testFetchNowPlayingMovies() throws {
        mainViewModel.nowPlayigMoviesSubject.dropFirst().sink { [weak self] movies in
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
            self?.expectation1.fulfill()
        }
        .store(in: &cancellables)
        mainViewModel.fetchNowPlayingMovies()
        wait(for: [expectation1], timeout: 1)
    }

    func testFetchMovieDetails() throws {
        let movie = Movie(
            movieId: 0,
            title: "dont_care",
            rating: 1,
            posterPath: nil,
            releaseDate: .distantPast,
            duration: nil)
        mainViewModel.movieDetailsSubject.sink { [weak self] movieDetails in
            XCTAssertEqual(movieDetails.movieId, 399566)
            XCTAssertEqual(movieDetails.title, "Godzilla vs. Kong")
            XCTAssertEqual(movieDetails.posterPath, "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")
            XCTAssertEqual(movieDetails.duration, TimeInterval(113 * 60))
            XCTAssertEqual(movieDetails.releaseDate, DateFormatter.yyyyMMdd.date(from: "2021-03-24"))
            XCTAssertEqual(movieDetails.overview, "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.")
            XCTAssertEqual(movieDetails.genres, ["Science Fiction", "Action"])
            self?.expectation1.fulfill()
        }
        .store(in: &cancellables)
        mainViewModel.fetchMovieDetais(for: movie)
        wait(for: [expectation1], timeout: 1)
    }
}

// swiftlint:enable line_length function_body_length

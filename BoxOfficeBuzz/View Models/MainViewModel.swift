//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {

    var popularMoviesSubject = CurrentValueSubject<[Movie], Never>([])
    var nowPlayigMoviesSubject = CurrentValueSubject<[Movie], Never>([])
    var movieDetailsSubject = PassthroughSubject<MovieDetails, Never>()

    private var lastPageLoaded: Int = 0
    private var totalPages: Int?
    private let nowPlayigMovieService: MovieService
    private let popularsMovieService: MovieService
    private let movieDetailsService: MovieService

    init(
        nowPlayigMovieService: MovieService = MovieService(),
        popularsMovieService: MovieService = MovieService(),
        movieDetailsService: MovieService = MovieService()
    ) {
        self.nowPlayigMovieService = nowPlayigMovieService
        self.popularsMovieService = popularsMovieService
        self.movieDetailsService = movieDetailsService
        URLCache.shared = {
            var cachePath: String?
            if let baseCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
                cachePath = baseCachePath.appending("/movie_box_cache/")
            }
            return URLCache(
                memoryCapacity: 50 * 1024 * 1024,
                diskCapacity: 50 * 1024 * 1024,
                diskPath: cachePath)
        }()
    }

    func fetchAllData() {
        fetchNowPlayingMovies()
        fetchPopularMovies()
    }

    func fetchNowPlayingMovies() {
        nowPlayigMovieService.fetchNowPlayingMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.nowPlayigMoviesSubject.send(movies)
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchPopularMovies() {
        if let totalPages = totalPages, lastPageLoaded >= totalPages {
            return
        }
        popularsMovieService.fetchPopularMovies(page: lastPageLoaded + 1) { [weak self] result in
            switch result {
            case .success(let paginatedMovies):
                var allMovies = (self?.popularMoviesSubject.value ?? [])
                allMovies.append(contentsOf: paginatedMovies.results)
                self?.popularMoviesSubject.send(allMovies)
                self?.lastPageLoaded = paginatedMovies.page
                self?.totalPages = paginatedMovies.totalPages
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchMovieDetais(for movie: Movie) {
        movieDetailsService.fetchMovieDetails(movieId: movie.movieId) { [weak self] result in
            switch result {
            case .success(let movieDetails):
                guard let self = self else {
                    return
                }
                var movies = self.popularMoviesSubject.value
                if let index = movies.firstIndex(where: {$0.movieId == movie.movieId}) {
                    movies[index] = Movie(
                        movieId: movie.movieId,
                        title: movie.title,
                        rating: movie.rating,
                        posterPath: movie.posterPath,
                        releaseDate: movie.releaseDate,
                        duration: movieDetails.duration)
                    self.popularMoviesSubject.send(movies)
                }
                self.movieDetailsSubject.send(movieDetails)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

class MovieService {

    enum Constants {
        static let nowPlayingEndpoint = "now_playing"
        static let popularEndpoint = "popular"
        static let languageParam = "language=en-US"
    }

    let apiService: ApiServiceProtocol

    init(apiService: ApiServiceProtocol = ApiService()) {
        self.apiService = apiService
    }

    func fetchNowPlayingMovies(completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        fetchMovies(from: Constants.nowPlayingEndpoint, completion: completion)
    }

    func fetchPopularMovies(page: Int, completion: @escaping (Result<PaginatedResults<Movie>, NetworkError>) -> Void) {
        fetchPaginatedMovies(from: Constants.popularEndpoint, page: page, completion: completion)
    }

    func fetchMovieDetails(
        movieId: Int,
        completion: @escaping (Result<MovieDetails, NetworkError>) -> Void
    ) {
        apiService.requestData(
            endpointPath: "\(movieId)",
            queryParameters: Constants.languageParam,
            queue: .main) { (result: Result<MovieDetails?, NetworkError>) in
            switch result {
            case .success(let value):
                if let movieDetails = value {
                    completion(.success(movieDetails))
                } else {
                    completion(.failure(.invalidJson))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchMovies(
        from endpoint: String,
        page: Int? = nil,
        completion: @escaping (Result<[Movie], NetworkError>) -> Void
    ) {
        var pageString = "1"
        if let page = page {
            pageString = "\(page)"
        }
        apiService.requestData(
            endpointPath: endpoint,
            queryParameters: "\(Constants.languageParam)&page=\(pageString)",
            queue: .main) { (result: Result<PaginatedResults<Movie>?, NetworkError>) in
            switch result {
            case .success(let value):
                if let value = value {
                    completion(.success(value.results))
                } else {
                    completion(.failure(.invalidJson))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchPaginatedMovies(
        from endpoint: String,
        page: Int? = nil,
        completion: @escaping (Result<PaginatedResults<Movie>, NetworkError>) -> Void
    ) {
        var pageString = "undefined"
        if let page = page {
            pageString = "\(page)"
        }
        apiService.requestData(
            endpointPath: endpoint,
            queryParameters: "\(Constants.languageParam)&page=\(pageString)",
            queue: .main) { (result: Result<PaginatedResults<Movie>?, NetworkError>) in
            switch result {
            case .success(let value):
                if let value = value {
                    completion(.success(value))
                } else {
                    completion(.failure(.invalidJson))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

File: BoxOfficeBuzz/Api Services/MovieService.swift

# MovieService

## Summary
The MovieService class provides a way to fetch movie data from an API. It can be used to retrieve now playing movies, popular movies, and movie details.

## Instance Variables
- `apiService`: `ApiServiceProtocol` - The API service used to make requests to the API.

## Methods
- `init(apiService: ApiServiceProtocol = ApiService())`: Initializes the MovieService instance with an API service.
- `fetchNowPlayingMovies(completion: @escaping (Result<[Movie], NetworkError>) -> Void)`: Fetches now playing movies and calls the completion handler with the result.
- `fetchPopularMovies(page: Int, completion: @escaping (Result<PaginatedResults<Movie>, NetworkError>) -> Void)`: Fetches popular movies for the given page and calls the completion handler with the result.
- `fetchMovieDetails(movieId: Int, completion: @escaping (Result<MovieDetails, NetworkError>) -> Void)`: Fetches movie details for the given movie ID and calls the completion handler with the result.
- `fetchMovies(from endpoint: String, page: Int? = nil, completion: @escaping (Result<[Movie], NetworkError>) -> Void)`: Fetches movies from the given endpoint and page, and calls the completion handler with the result. (Private method)
- `fetchPaginatedMovies(from endpoint: String, page: Int? = nil, completion: @escaping (Result<PaginatedResults<Movie>, NetworkError>) -> Void)`: Fetches paginated movies from the given endpoint and page, and calls the completion handler with the result. (Private method)

## Dependencies
- `ApiServiceProtocol`: The protocol used to define the API service.


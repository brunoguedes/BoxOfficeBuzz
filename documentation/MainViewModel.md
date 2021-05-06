File: BoxOfficeBuzz/View Models/MainViewModel.swift

# MainViewModel

## Summary
MainViewModel is a class that manages data for a movie-related application. It provides subjects for popular movies, now playing movies, and movie details, and fetches data from movie services.

## Instance Variables
- `popularMoviesSubject`: `CurrentValueSubject<[Movie], Never>` - A subject that holds the popular movies data.
- `nowPlayigMoviesSubject`: `CurrentValueSubject<[Movie], Never>` - A subject that holds the now playing movies data.
- `movieDetailsSubject`: `PassthroughSubject<MovieDetails, Never>` - A subject that holds the movie details data.
- `lastPageLoaded`: `Int` - The last page loaded for popular movies.
- `totalPages`: `Int?` - The total number of pages for popular movies.
- `nowPlayigMovieService`: `MovieService` - A service for fetching now playing movies.
- `popularsMovieService`: `MovieService` - A service for fetching popular movies.
- `movieDetailsService`: `MovieService` - A service for fetching movie details.

## Methods
- `init(nowPlayigMovieService: MovieService, popularsMovieService: MovieService, movieDetailsService: MovieService) -> Void` - Initializes the view model with movie services.
- `fetchAllData() -> Void` - Fetches all data, including now playing movies and popular movies.
- `fetchNowPlayingMovies() -> Void` - Fetches now playing movies from the movie service.
- `fetchPopularMovies() -> Void` - Fetches popular movies from the movie service, handling pagination.
- `fetchMovieDetais(movie: Movie) -> Void` - Fetches movie details for a given movie and updates the popular movies subject.

## Dependencies
- `MovieService` - A service for fetching movie data.
- `Movie` - A model for movie data.
- `MovieDetails` - A model for movie details data.


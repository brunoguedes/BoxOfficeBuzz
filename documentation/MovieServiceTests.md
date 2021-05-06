File: BoxOfficeBuzzTests/MovieServiceTests.swift

# MovieServiceTests
## Summary
MovieServiceTests is a test class that provides unit tests for the MovieService class. It can be used to verify the correctness of the MovieService class's methods, such as fetching now playing movies, popular movies, and movie details.

## Methods
- ### testGetNowPlayingMovies() -> Void
  Tests the `fetchNowPlayingMovies` method of the MovieService class. It verifies that the method calls the API with the correct HTTP method, endpoint, and query parameters, and that it returns the expected movie data.

- ### testGetPopularMovies() -> Void
  Tests the `fetchPopularMovies` method of the MovieService class. It verifies that the method calls the API with the correct HTTP method, endpoint, and query parameters, and that it returns the expected paginated movie data.

- ### testGetMovieDetails() -> Void
  Tests the `fetchMovieDetails` method of the MovieService class. It verifies that the method calls the API with the correct HTTP method, endpoint, and query parameters, and that it returns the expected movie details data.


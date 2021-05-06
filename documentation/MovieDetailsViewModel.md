File: BoxOfficeBuzz/View Models/MovieDetailsViewModel.swift

# MovieDetailsViewModel
## Summary
MovieDetailsViewModel is a struct that holds movie details data and provides a way to initialize it with a MovieDetails object. It can be used to store and manage movie details data in a structured way.

## Instance Variables
- `title`: `String` - The title of the movie.
- `subtitle`: `String` - The subtitle of the movie, including the release date and duration.
- `overview`: `String?` - The overview of the movie.
- `posterImageURL`: `URL?` - The URL of the movie poster image.
- `genres`: `[String]` - An array of genres of the movie.

## Methods
- `init(movieDetails: MovieDetails) -> Void` - Initializes a MovieDetailsViewModel instance with a MovieDetails object, setting the title, subtitle, overview, posterImageURL, and genres properties accordingly.

## Dependencies
- `URL?`
- `String?`
- `[String]`
- `String`


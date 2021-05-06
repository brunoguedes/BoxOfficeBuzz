File: BoxOfficeBuzz/Models/MovieDetails.swift

# Genre
## Summary
Represents a genre entity that conforms to the Decodable protocol, allowing it to be initialized from external data.

## Instance Variables
- `id`: `Int` - Unique identifier of the genre.
- `name`: `String` - Name of the genre.

## Dependencies
- `Int`
- `String`

# MovieDetails

## Summary
MovieDetails represents a data structure to hold information about a movie. It can be used to store and manage movie details such as title, duration, poster path, release date, overview, and genres.

## Instance Variables
- `movieId`: `Int` - The unique identifier of the movie.
- `title`: `String` - The title of the movie.
- `duration`: `TimeInterval?` - The duration of the movie.
- `posterPath`: `String?` - The path to the movie's poster image.
- `releaseDate`: `Date` - The release date of the movie.
- `overview`: `String?` - A brief summary of the movie.
- `genres`: `[String]` - An array of genres associated with the movie.

## Dependencies
- `Date`
- `String?`
- `[String]`
- `String`
- `TimeInterval?`
- `Int`

# MovieDetails
## Summary
MovieDetails is a struct that represents a movie's details. It can be used to store and manage information about a movie, including its ID, title, duration, poster path, release date, overview, and genres.

## Properties
- `movieId`: `Int` - The ID of the movie.
- `title`: `String` - The title of the movie.
- `duration`: `TimeInterval?` - The duration of the movie.
- `posterPath`: `String?` - The path to the movie's poster.
- `releaseDate`: `Date` - The release date of the movie.
- `overview`: `String?` - A brief overview of the movie.
- `genres`: `[String]` - An array of genres associated with the movie.

## Methods
None.


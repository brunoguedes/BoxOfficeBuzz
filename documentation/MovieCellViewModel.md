File: BoxOfficeBuzz/View Models/MovieCellViewModel.swift

# MovieCellViewModel
## Summary
MovieCellViewModel is a struct that represents a view model for a movie cell. It can be used to display movie information such as title, release date, poster image, rating, and duration.

## Instance Variables
- `title: String`: The title of the movie.
- `releaseDate: String`: The release date of the movie.
- `posterImageURL: URL?`: The URL of the poster image of the movie.
- `rating: Int`: The rating of the movie.
- `ratingColor: UIColor`: The color of the rating.
- `ratingBackgroundColor: UIColor`: The background color of the rating.
- `duration: TimeInterval?`: The duration of the movie.
- `durationFormatted: String`: The formatted duration of the movie.
- `accessibilityText: String`: The accessibility text for the movie.
- `accessibilityHint: String`: The accessibility hint for the movie.

## Methods
- `init(movie: Movie)`: Initializes a MovieCellViewModel instance with a Movie object.

## Dependencies
- `UIColor`
- `URL?`
- `String`
- `TimeInterval?`
- `Int`


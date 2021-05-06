File: BoxOfficeBuzzTests/MovieCellViewModelTests.swift

# MovieCellViewModelTests
## Summary
`MovieCellViewModelTests` is a test class that verifies the properties of `MovieCellViewModel`. It provides test cases to ensure that the view model correctly sets up its properties based on a given `Movie` object.

## Methods
- ### testGoodMovieViewModelProperties() -> Void
  Tests the properties of a `MovieCellViewModel` instance with a good movie rating (5.0). Verifies that the title, rating, rating color, rating background color, poster image URL, release date, and duration are correctly set.

- ### testBadMovieViewModelProperties() -> Void
  Tests the properties of a `MovieCellViewModel` instance with a bad movie rating (4.9). Verifies that the title, rating, rating color, rating background color, poster image URL, and release date are correctly set.


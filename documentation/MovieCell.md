File: BoxOfficeBuzz/Views/MovieCell.swift

# MovieCell

## Summary
The MovieCell class is a custom UITableViewCell that displays information about a movie. It can be used to populate a table view with movie data.

## Instance Variables
- `posterImageView`: `WebImageView!` - An outlet for the poster image view.
- `movieNameLabel`: `UILabel!` - An outlet for the movie name label.
- `releaseDateLabel`: `UILabel!` - An outlet for the release date label.
- `durationLabel`: `UILabel!` - An outlet for the duration label.
- `ratingView`: `RatingView!` - An outlet for the rating view.

## Methods
- `configure(viewModel: MovieCellViewModel) -> Void` - Configures the cell with the provided view model. It sets the image, title, release date, duration, rating, and accessibility properties of the cell.

## Dependencies
- `UILabel!`
- `RatingView!`
- `WebImageView!`


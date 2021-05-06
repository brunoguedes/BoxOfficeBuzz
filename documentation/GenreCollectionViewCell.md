File: BoxOfficeBuzz/Views/GenreCollectionViewCell.swift

# GenreCollectionViewCell
## Summary
A `GenreCollectionViewCell` is a custom UICollectionViewCell that displays a genre label in a rounded view. It can be used in a UICollectionView to display a list of genres.

## Instance Variables
- `roundedView`: `UIView!` - A private outlet for the rounded view.
- `genreLabel`: `UILabel!` - A private outlet for the genre label.

## Methods
- `func configure(genre: String) -> Void` - Configures the cell with a given genre. Sets the corner radius of the rounded view to 6 and sets the text of the genre label to the given genre.

## Dependencies
- `UILabel!`
- `UIView!`


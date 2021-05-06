File: BoxOfficeBuzz/Views/PosterCollectionViewCell.swift

# PosterCollectionViewCell
## Summary
A UICollectionViewCell subclass that displays a poster image. It can be used to display a poster image in a collection view.

## Instance Variables
- `posterImageView`: `WebImageView!` - An outlet to a WebImageView that displays the poster image.

## Methods
- `configure(url: URL?)` - Configures the cell with a given URL.
  - Definition: `func configure(url: URL?)`
  - Description: Sets the poster image view's image to nil and loads the image from the given URL using cache if the URL is not nil.

## Dependencies
- `WebImageView`


File: BoxOfficeBuzz/View Controllers/MovieDetailsViewController.swift

# MovieDetailsViewController

## Summary
MovieDetailsViewController is a view controller that displays movie details. It can be used to show movie information such as title, subtitle, overview, and genres.

## Instance Variables
- `viewModel`: `MovieDetailsViewModel?` - The view model that provides the movie details data.
- `posterImageView`: `WebImageView!` - The image view that displays the movie poster.
- `titleLabel`: `UILabel!` - The label that displays the movie title.
- `subtitleLabel`: `UILabel!` - The label that displays the movie subtitle.
- `overviewLabel`: `UILabel!` - The label that displays the movie overview.
- `genresCollectionView`: `UICollectionView!` - The collection view that displays the movie genres.

## Methods
- `func viewDidLoad() -> Void` - Sets up the view with the movie details data from the view model.
- `func onCloseButton(sender: Any) -> Void` - Dismisses the view controller when the close button is tapped.
- `func numberOfSections(in collectionView: UICollectionView) -> Int` - Returns the number of sections in the genres collection view.
- `func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int` - Returns the number of items in the genres collection view.
- `func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell` - Configures and returns a cell for the genres collection view.

## Dependencies
- `UILabel!`
- `WebImageView!`
- `UICollectionView!`
- `MovieDetailsViewModel?`
- `UICollectionViewCell`
- `Int`


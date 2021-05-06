File: BoxOfficeBuzz/Views/PostersCell.swift

# PostersCell

## Summary
PostersCell is a UITableViewCell that displays a collection of movie posters. It can be used to present a list of movies with their corresponding posters.

## Instance Variables
- `movies`: `[Movie]` - An array of Movie objects to be displayed in the cell.
- `completion`: `((Movie) -> Void)?` - A closure that is called when a movie poster is selected.
- `postersCollectionView`: `UICollectionView!` - The UICollectionView that displays the movie posters.

## Methods
- `awakeFromNib() -> Void`: Called after the view is loaded from the nib file. It sets up the content view to have a flexible height.
- `configure(movies: [Movie], completion: @escaping ((Movie) -> Void)) -> Void`: Configures the cell with an array of movies and a completion handler.
- `numberOfSections(in: UICollectionView) -> Int`: Returns the number of sections in the collection view, which is always 1.
- `collectionView(_:UICollectionView, numberOfItemsInSection:) -> Int`: Returns the number of items in the collection view, which is the count of the movies array.
- `collectionView(_:UICollectionView, cellForItemAt:) -> UICollectionViewCell`: Returns a configured UICollectionViewCell for the given indexPath.
- `collectionView(_:UICollectionView, didSelectItemAt:) -> Void`: Calls the completion handler with the selected movie when a cell is selected.

## Dependencies
- `Movie`
- `UICollectionView`
- `UICollectionViewCell`
- `Int`


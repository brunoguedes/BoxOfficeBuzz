File: BoxOfficeBuzz/View Controllers/MainViewController.swift

# MainViewController

## Summary
MainViewController is a view controller that manages a table view displaying playing now and most popular movies. It uses a view model to fetch and display movie data.

## Instance Variables
- `viewModel`: `MainViewModel` - The view model used to fetch and display movie data.
- `cancellables`: `Set<AnyCancellable>` - A set of cancellable subscriptions to the view model's publishers.
- `moviesTableView`: `UITableView!` - The table view that displays the movie data.

## Methods
- `func viewDidLoad() -> Void` - Sets up the view controller, registers table view headers and cells, and subscribes to the view model's publishers.
- `func showMovieDetais(movieDetails: MovieDetails) -> Void` - Presents a movie details view controller with the given movie details.
- `func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?` - Returns a header view for the given section.
- `func numberOfSections(in tableView: UITableView) -> Int` - Returns the number of sections in the table view.
- `func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int` - Returns the number of rows in the given section.
- `func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell` - Returns a cell for the given index path.
- `func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Void` - Fetches movie details when a row is selected.

## Dependencies
- `UITableView`
- `UITableViewCell`
- `UIView`
- `Int`


//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit
import Combine

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    enum MainViewSections: Int {
        case playingNow = 0
        case mostPopular = 1
    }

    enum Constants {
        static let playingNowSectionTitle = "Playing now"
        static let mostPopularSectionTitle = "Most popular"
        static let titleImageName = "NavigationBarTitle"
    }

    private let viewModel = MainViewModel()
    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var moviesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: UIImage(named: Constants.titleImageName))
        self.navigationItem.titleView = imageView

        moviesTableView.register(
            MainTableSectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: MainTableSectionHeaderView.reuseIdentifier)

        viewModel.nowPlayigMoviesSubject.sink { [weak self] _ in
            self?.moviesTableView.reloadSections([MainViewSections.playingNow.rawValue], with: .none)
        }
        .store(in: &cancellables)

        viewModel.popularMoviesSubject.sink { [weak self] _ in
            self?.moviesTableView.reloadData()
        }
        .store(in: &cancellables)

        viewModel.movieDetailsSubject.sink { [weak self] movieDetails in
            self?.showMovieDetais(for: movieDetails)
        }
        .store(in: &cancellables)

        viewModel.fetchAllData()
    }

    private func showMovieDetais(for movieDetails: MovieDetails) {
        guard let movieDetailsViewController = self.storyboard?.instantiateViewController(
            identifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        movieDetailsViewController.viewModel = MovieDetailsViewModel(movieDetails: movieDetails)
        present(movieDetailsViewController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: MainTableSectionHeaderView.reuseIdentifier) as? MainTableSectionHeaderView else {
            fatalError("Unable to dequeueReusableHeader \"MainTableSectionHeaderView\"")
        }
        switch MainViewSections(rawValue: section) {
        case .playingNow:
            headerView.configure(header: Constants.playingNowSectionTitle)
        case .mostPopular:
            headerView.configure(header: Constants.mostPopularSectionTitle)
        case .none:
            break
        }
        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch MainViewSections(rawValue: section) {
        case .playingNow:
            return 1
        case .mostPopular:
            return viewModel.popularMoviesSubject.value.count
        case .none:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch MainViewSections(rawValue: indexPath.section) {
        case .playingNow:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: PostersCell.reuseIdentifier,
                    for: indexPath) as? PostersCell else {
                fatalError("Unable to dequeueReusableCell \"PostersCell\"")
            }
            cell.configure(movies: viewModel.nowPlayigMoviesSubject.value) { [weak self] movie in
                self?.viewModel.fetchMovieDetais(for: movie)
            }
            return cell
        case .mostPopular:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: MovieCell.reuseIdentifier,
                    for: indexPath) as? MovieCell else {
                fatalError("Unable to dequeueReusableCell \"MovieCell\"")
            }
            let movieCellViewModel = MovieCellViewModel(movie: viewModel.popularMoviesSubject.value[indexPath.row])
            cell.configure(viewModel: movieCellViewModel)
            if indexPath.row == viewModel.popularMoviesSubject.value.count - 1 {
                viewModel.fetchPopularMovies()
            }
            return cell
        case .none:
            fatalError("Unknown tableView section")
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.popularMoviesSubject.value[indexPath.row]
        viewModel.fetchMovieDetais(for: movie)
    }
}

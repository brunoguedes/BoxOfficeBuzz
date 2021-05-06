//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class PostersCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    static let reuseIdentifier = "PostersCell"

    private var movies: [Movie] = []
    private var completion: ((Movie) -> Void)?
    @IBOutlet private var postersCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.autoresizingMask = .flexibleHeight
    }

    func configure(movies: [Movie], completion: @escaping ((Movie) -> Void)) {
        self.movies = movies
        self.completion = completion
        postersCollectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCollectionViewCell.reuseIdentifier,
                for: indexPath) as? PosterCollectionViewCell else {
            fatalError("Unable to dequeueReusableCell \"PosterCollectionViewCell\"")
        }
        let movie = movies[indexPath.row]
        let accessibility = "Now Playing: \(movie.title)"
        cell.accessibilityLabel = accessibility
        cell.accessibilityIdentifier = accessibility
        if let posterPath = movie.posterPath,
           let posterImageURL = URL(string: posterPath, relativeTo: AppConfig.imageBaseURL()) {
            cell.configure(url: posterImageURL)
        } else {
            cell.configure(url: nil)
        }
        return cell
    }

    // MARK: - UICollectionViewDelegate

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        completion?(movies[indexPath.row])
    }

}

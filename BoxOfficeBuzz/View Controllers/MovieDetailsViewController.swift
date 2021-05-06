//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, UICollectionViewDataSource {

    var viewModel: MovieDetailsViewModel?

    @IBOutlet var posterImageView: WebImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var genresCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            return
        }

        if let posterImageURL = viewModel.posterImageURL {
            posterImageView.loadImageUsingCache(withUrl: posterImageURL)
        }
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        overviewLabel.text = viewModel.overview
        genresCollectionView.collectionViewLayout = LeftAlignedCollectionViewLayout(spacing: .spacing1x)
    }

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.genres.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GenreCollectionViewCell.reuseIdentifier,
                for: indexPath) as? GenreCollectionViewCell else {
            fatalError("Unable to dequeueReusableCell \"GenreCollectionViewCell\"")
        }
        if let genre = viewModel?.genres[indexPath.row] {
            cell.configure(genre: genre)
        }
        return cell
    }
}

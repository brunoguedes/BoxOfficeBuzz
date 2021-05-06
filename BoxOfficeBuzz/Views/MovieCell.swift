//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

//
// MARK: - Movie Cell
//
class MovieCell: UITableViewCell {

    //
    // MARK: - Class Constants
    //
    static let reuseIdentifier = "MovieCell"

    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var posterImageView: WebImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!

    func configure(viewModel: MovieCellViewModel) {
        posterImageView.image = nil
        if let posterImageURL = viewModel.posterImageURL {
            posterImageView.loadImageUsingCache(withUrl: posterImageURL)
        }
        movieNameLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        durationLabel.text = viewModel.durationFormatted
        ratingView.rating = viewModel.rating
        accessibilityLabel = viewModel.accessibilityText
        accessibilityIdentifier = viewModel.accessibilityText
        accessibilityTraits = .allowsDirectInteraction
        accessibilityHint = viewModel.accessibilityHint
    }
}

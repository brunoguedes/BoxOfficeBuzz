//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GenreCollectionViewCell"

    @IBOutlet private var roundedView: UIView!
    @IBOutlet private var genreLabel: UILabel!

    func configure(genre: String) {
        roundedView.layer.cornerRadius = 6
        genreLabel.text = genre
    }
}

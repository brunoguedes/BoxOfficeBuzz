//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PosterCollectionViewCell"

    @IBOutlet private var posterImageView: WebImageView!

    func configure(url: URL?) {
        posterImageView.image = nil
        if let url = url {
            posterImageView.loadImageUsingCache(withUrl: url)
        }
    }
}

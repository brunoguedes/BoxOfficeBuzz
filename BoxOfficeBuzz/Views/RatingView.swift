//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class RatingView: UIView {
    var rating: Int = 0 {
        didSet {
            ratingLabel.text = "\(rating)"
            circleView.rating = rating
            if rating >= 50 {
                circleView.brightRingColor = .ratingViewGood
                circleView.darkRingColor = .ratingViewGoodBackground
            } else {
                circleView.brightRingColor = .ratingViewBad
                circleView.darkRingColor = .ratingViewBadBackground
            }
        }
    }

    private let circleView = CircleView()
    private let ratingLabel = UILabel()
    private let percentLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }

    func initSubviews() {
        backgroundColor = .clear
        addPinned(subView: circleView)
        ratingLabel.textColor = .textColor
        ratingLabel.textAlignment = .right
        ratingLabel.font = .preferredFont(forTextStyle: .headline)
        percentLabel.text = "%"
        percentLabel.textColor = .textColor
        percentLabel.textAlignment = .center
        percentLabel.font = .preferredFont(forTextStyle: .caption2)
        circleView.addSubViewWithoutAutoresizingMaskIntoConstraints(subView: ratingLabel)
        circleView.addSubViewWithoutAutoresizingMaskIntoConstraints(subView: percentLabel)
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: .spacing2x),
            ratingLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            percentLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -.spacing2x),
            percentLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: 0)
            ])
    }
}

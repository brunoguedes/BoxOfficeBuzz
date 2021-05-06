//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

struct MovieCellViewModel {
    enum Constants {
        static let dateUnavailable = "Date unavailable"
        static let accessibilityHint = "Double Tap for more details."
    }

    private (set) var title: String
    private (set) var releaseDate: String
    private (set) var posterImageURL: URL?
    private (set) var rating: Int
    private (set) var ratingColor: UIColor
    private (set) var ratingBackgroundColor: UIColor

    var duration: TimeInterval?
    var durationFormatted: String {
        guard let duration = duration else {
            return "_"
        }
        return duration.formattedDuration()
    }
    var accessibilityText: String {
        var text = "\(title). Released on \(releaseDate). Rated \(rating)%."
        if let duration = duration {
            text.append("Duration is \(duration / 60).")
        }
        return text
    }

    var accessibilityHint: String {
        return Constants.accessibilityHint
    }

    init(movie: Movie) {
        title = movie.title
        releaseDate = movie.releaseDate == .distantPast ?
            Constants.dateUnavailable :
            DateFormatter.MMMddyyyy.string(from: movie.releaseDate)
        rating = Int(truncating: (movie.rating * 10) as NSDecimalNumber)
        ratingColor = rating >= 50 ? .ratingViewGood : .ratingViewBad
        ratingBackgroundColor = rating >= 50 ? .ratingViewGoodBackground : .ratingViewBadBackground
        if let posterPath = movie.posterPath {
            posterImageURL = URL(string: posterPath, relativeTo: AppConfig.imageBaseURL())
        }
        duration = movie.duration
    }
}

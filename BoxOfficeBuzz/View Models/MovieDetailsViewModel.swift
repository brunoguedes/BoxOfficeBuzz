//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

struct MovieDetailsViewModel {
    private (set) var title: String
    private (set) var subtitle: String
    private (set) var overview: String?
    private (set) var posterImageURL: URL?
    private (set) var genres: [String]

    init(movieDetails: MovieDetails) {
        title = movieDetails.title
        var duration = ""
        if let movieDuration = movieDetails.duration {
            duration = " - \(movieDuration.formattedDuration())"
        }
        subtitle = "\(DateFormatter.MMMddyyyy.string(from: movieDetails.releaseDate))\(duration)"
        if let posterPath = movieDetails.posterPath {
            posterImageURL = URL(string: posterPath, relativeTo: AppConfig.imageBaseURL())
        }
        overview = movieDetails.overview
        genres = movieDetails.genres
    }
}

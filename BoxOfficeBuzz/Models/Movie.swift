//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

struct Movie {
    let movieId: Int
    let title: String
    let rating: Decimal
    let posterPath: String?
    let releaseDate: Date
    let duration: TimeInterval?
}

extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case title
        case rating = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }

    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            movieId = try values.decode(Int.self, forKey: .movieId)
            title = try values.decode(String.self, forKey: .title)
            rating = try values.decode(Decimal.self, forKey: .rating)
            if let posterPathTemp = (try values.decode(String?.self, forKey: .posterPath)) {
                if posterPathTemp.hasPrefix("/") {
                    posterPath = String(posterPathTemp.dropFirst(1))
                } else {
                    posterPath = posterPathTemp
                }
            } else {
                posterPath = nil
            }
            if let releaseDateString = try? values.decode(String.self, forKey: .releaseDate),
               let date = DateFormatter.yyyyMMdd.date(from: releaseDateString) {
                releaseDate = date
            } else {
                releaseDate = .distantPast
            }
            duration = nil
        } catch {
            throw NetworkError.invalidJson
        }
    }
}

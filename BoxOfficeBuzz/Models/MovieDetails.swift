//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

private struct Genre: Decodable {
    let id: Int
    let name: String
}

struct MovieDetails {
    let movieId: Int
    let title: String
    let duration: TimeInterval?
    let posterPath: String?
    let releaseDate: Date
    let overview: String?
    let genres: [String]
}

extension MovieDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case title
        case duration = "runtime"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case overview
        case genres
    }

    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            movieId = try values.decode(Int.self, forKey: .movieId)
            title = try values.decode(String.self, forKey: .title)
            if let durationMinutes = try? values.decode(Int.self, forKey: .duration) {
                duration = TimeInterval(durationMinutes * 60)
            } else {
                duration = nil
            }
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
                throw NetworkError.invalidJson
            }
            overview = try values.decode(String?.self, forKey: .overview)
            genres = (try values.decode([Genre].self, forKey: .genres)).map { genre in
                return genre.name
            }
        } catch {
            throw NetworkError.invalidJson
        }
    }
}

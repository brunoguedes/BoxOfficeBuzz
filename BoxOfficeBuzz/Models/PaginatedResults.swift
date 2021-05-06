//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

struct PaginatedResults<T: Decodable> {
    let results: [T]
    let page: Int
    let totalPages: Int
}

extension PaginatedResults: Decodable {
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPages = "total_pages"
    }

    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            results = try values.decode([T].self, forKey: .results)
            page = try values.decode(Int.self, forKey: .page)
            totalPages = try values.decode(Int.self, forKey: .totalPages)
        } catch {
            throw NetworkError.invalidJson
        }
    }
}

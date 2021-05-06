//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

@testable import BoxOfficeBuzz

extension Encodable {
    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}

class MockApiService: ApiServiceProtocol {

    enum MockErrorType: Error {
        case mockError(String)
    }

    enum MockResponses {
        case empty
        case nowPlayingMovies
        case popularMoviesPage1
        case popularMoviesPage2
        case movieDetailsGodzilla
    }

    struct CallInfo {
        // swiftlint:disable nesting
        enum HTTPMethod {
            case post
            case get
            case patch
            case put
            case delete
        }
        // swiftlint:enable nesting
        public var endpointCalled: String?
        public var httpMethod: HTTPMethod
        public var queryParameters: String?
        public var jsonData: Data?

        init(endpointCalled: String?, httpMethod: HTTPMethod, queryParameters: String?, data: Encodable?) {
            self.endpointCalled = endpointCalled
            self.httpMethod = httpMethod
            self.queryParameters = queryParameters
            self.jsonData = data?.toJSONData()
        }
    }

    public var mockResponses: [MockResponses] = [.empty]
    public var latestCallInfo: CallInfo?

    private var filename: String {
        guard let mockResponse = mockResponses.first else {
            return "ValidEmptyResponse"
        }
        mockResponses.removeFirst()
        switch mockResponse {
        case .empty:
            return "ValidEmptyResponse"
        case .nowPlayingMovies:
            return "now_playing_movies"
        case .popularMoviesPage1:
            return "popular_movies_page_1"
        case .popularMoviesPage2:
            return "popular_movies_page_2"
        case .movieDetailsGodzilla:
            return "movie_details_godzilla_vs_kong"
        }
    }

    func requestData<T: Decodable>(
        endpointPath: String,
        queryParameters: String? = nil,
        queue: DispatchQueue = .main,
        completion: @escaping (Result<T?, NetworkError>) -> Void
    ) {
        latestCallInfo = CallInfo(
            endpointCalled: endpointPath,
            httpMethod: .get,
            queryParameters: queryParameters,
            data: nil)
        let path = Bundle(for: type(of: self)).path(forResource: self.filename, ofType: "json")
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
            completion(.failure(NetworkError.invalidJson))
            return
        }
        if let value = try? JSONDecoder().decode(T.self, from: jsonData) {
            completion(.success(value))
            return
        } else {
            completion(.failure(NetworkError.invalidJson))
            return
        }
    }
}

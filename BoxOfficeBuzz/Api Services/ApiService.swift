//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case badURL
    case serviceError(Error)
    case invalidJson
}

protocol ApiServiceProtocol {
    func requestData<T: Decodable>(endpointPath: String,
                                   queryParameters: String?,
                                   queue: DispatchQueue,
                                   completion: @escaping (Result<T?, NetworkError>) -> Void)
}

class ApiService: ApiServiceProtocol {

    private let baseURL: URL
    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?
    var errorMessage = ""

    init() {
        self.baseURL = AppConfig.baseURL()
    }

    /// Request data from an end point.
    ///
    /// - Parameters:
    ///   - endpointPath:      The relative path of the end point.
    ///   - queryParameters:   Optional request query parameters. Defaults to `nil`.
    ///   - queue:             The queue on which the completion handler is dispatched. Defaults to `.main`.
    ///   - completion:        A closure to be executed once the request has finished.
    public func requestData<T: Decodable>(endpointPath: String,
                                          queryParameters: String? = nil,
                                          queue: DispatchQueue = .main,
                                          completion: @escaping (Result<T?, NetworkError>) -> Void) {
        dataTask?.cancel()

        var relativePath = endpointPath.appending("?api_key=\(AppConfig.apiKey)")
        if let queryParameters = queryParameters {
            relativePath.append("&\(queryParameters)")
        }
        guard let url = URL(string: relativePath, relativeTo: baseURL) else {
            return
        }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        dataTask = defaultSession.dataTask(with: request) { [weak self] data, _, error in
            defer {
                self?.dataTask = nil
            }

            if let error = error {
                queue.async {
                    completion(.failure(.serviceError(error)))
                }
                return
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let parsedData = try decoder.decode(T.self, from: data)
                    queue.async {
                        completion(.success(parsedData))
                    }
                    return
                } catch _ as NSError {
                    queue.async {
                        completion(.failure(.invalidJson))
                    }
                    return
                }
            }
        }

        dataTask?.resume()
    }
}

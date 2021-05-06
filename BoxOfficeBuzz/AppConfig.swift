//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

enum AppConfig {
    static let apiKey = ""
    static let remoteURL = "https://api.themoviedb.org/3/movie/"
    static let imageRemoteURL = "https://image.tmdb.org/t/p/w500/"

    static func baseURL() -> URL {
        #if DEBUG
        guard let url = URL(string: ProcessInfo.processInfo.environment["BASE_URL"] ??
                                AppConfig.remoteURL) else {
            fatalError("Failing fast because the baseURL is nil")
        }
        #else
        guard let url = URL(string: AppConfig.remoteURL) else {
            fatalError("Failing fast because the baseURL is nil")
        }
        #endif
        return url
    }

    static func imageBaseURL() -> URL {
        #if DEBUG
        guard let url = URL(string: ProcessInfo.processInfo.environment["BASE_URL"] ??
                                AppConfig.imageRemoteURL) else {
            fatalError("Failing fast because the baseURL is nil")
        }
        #else
        guard let url = URL(string: AppConfig.imageRemoteURL) else {
            fatalError("Failing fast because the baseURL is nil")
        }
        #endif
        return url
    }
}

//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {

    /// ImageView that loads images from a URL and saves into a cache.

    var dataTask: URLSessionDataTask?

    deinit {
        dataTask?.cancel()
    }

    func loadImageUsingCache(withUrl url: URL) {
        defer {
            dataTask = nil
        }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil, let data = data else {
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.image = image
                }
            }

        }
        dataTask?.resume()
    }
}

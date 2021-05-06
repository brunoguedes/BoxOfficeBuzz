//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import Foundation

extension TimeInterval {
    func formattedDuration() -> String {
        let numberOfHours = Int(self) / 3600
        let numberOfMinutes = Int(self/60) % 60
        if numberOfHours > 0 {
            return "\(numberOfHours)h \(numberOfMinutes)m"
        } else {
            return "\(numberOfMinutes)m"
        }

    }
}

//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class MainTableSectionHeaderView: UITableViewHeaderFooterView {

    static let reuseIdentifier: String = "MainTableSectionHeaderView"

    private let headerLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .darkGray
        addHeaderLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addHeaderLabel() {
        headerLabel.font = .preferredFont(forTextStyle: .body)
        headerLabel.numberOfLines = 0
        headerLabel.backgroundColor = .clear
        headerLabel.textColor = .titleTextColor
        headerLabel.textAlignment = .left
        contentView.addPinned(
            subView: headerLabel,
            leading: .spacing3x,
            trailing: -.spacing3x,
            top: .spacing1x,
            bottom: -.spacing1x)
    }

    public func configure(header: String) {
        headerLabel.text = header
    }

}

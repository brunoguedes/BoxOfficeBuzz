//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

extension UIView {
    func addPinned(
        subView: UIView,
        leading: CGFloat = 0.0,
        trailing: CGFloat = 0.0,
        top: CGFloat = 0.0,
        bottom: CGFloat = 0.0
    ) {
        addSubViewWithoutAutoresizingMaskIntoConstraints(subView: subView)
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing),
            subView.topAnchor.constraint(equalTo: topAnchor, constant: top),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            ])
    }

    func addPinnedToSafeArea(
        subView: UIView,
        leading: CGFloat = 0.0,
        trailing: CGFloat = 0.0,
        top: CGFloat = 0.0,
        bottom: CGFloat = 0.0
    ) {
        addSubViewWithoutAutoresizingMaskIntoConstraints(subView: subView)
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leading),
            subView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: trailing),
            subView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: top),
            subView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: bottom)
            ])
    }

    func addSubViewWithoutAutoresizingMaskIntoConstraints(subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.clipsToBounds = true
        addSubview(subView)
    }

    func addBlurredBackground(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        self.addPinned(subView: blurView)
        self.sendSubviewToBack(blurView)
    }
}

//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class LeftAlignedCollectionViewLayout: UICollectionViewFlowLayout {

    private var baseSpacing: CGFloat

    required init(spacing: CGFloat) {
        baseSpacing = spacing
        super.init()

        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        minimumInteritemSpacing = spacing
        minimumLineSpacing = spacing
        sectionInset = .zero
        sectionInsetReference = .fromSafeArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributesForElementsInRect = super.layoutAttributesForElements(in: rect) else { return nil }
        let layoutAttributes = layoutAttributesForElementsInRect.compactMap {
            $0.copy() as? UICollectionViewLayoutAttributes
        }
        guard scrollDirection == .vertical else { return layoutAttributes }

        let cellAttributes = layoutAttributes.filter({ $0.representedElementCategory == .cell })
        let dictionary = Dictionary(
            grouping: cellAttributes,
            by: { ($0.center.y / baseSpacing).rounded(.up) * baseSpacing })
        for (_, attributes) in dictionary {
            var leftInset = sectionInset.left
            for attribute in attributes {
                attribute.frame.origin.x = leftInset
                leftInset = attribute.frame.maxX + minimumInteritemSpacing
            }
        }
        return layoutAttributes
    }
}

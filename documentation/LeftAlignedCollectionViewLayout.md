File: BoxOfficeBuzz/Views/LeftAlignedCollectionViewLayout.swift

# LeftAlignedCollectionViewLayout
## Summary
LeftAlignedCollectionViewLayout is a custom UICollectionViewFlowLayout that aligns cells to the left. It can be used to create a UICollectionView with left-aligned cells, with customizable spacing between cells and lines.

## Instance Variables
- `baseSpacing`: `CGFloat` - The base spacing used to calculate the layout.

## Methods
- `init(spacing: CGFloat) -> Void` - Initializes the layout with a specified spacing.
- `init?(aDecoder: NSCoder) -> Void` - Initializes the layout from a coder. **Not implemented.**
- `layoutAttributesForElements(rect: CGRect) -> [UICollectionViewLayoutAttributes]?` - Returns an array of UICollectionViewLayoutAttributes for the elements in the specified rect. It lays out the cells to the left, with the specified spacing.

## Dependencies
- `UICollectionViewLayoutAttributes`
- `CGFloat`


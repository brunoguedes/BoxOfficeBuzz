File: BoxOfficeBuzz/Views/CircleView.swift

# CircleView
## Summary
CircleView is a custom UIView that displays a circular progress ring with a background ring. It can be used to visualize a rating or progress value.

## Instance Variables
- `progressLayer`: `CAShapeLayer` - The layer used to draw the progress ring.
- `rating`: `Int` - The current rating or progress value.
- `darkRingColor`: `UIColor` - The color of the background ring.
- `brightRingColor`: `UIColor` - The color of the progress ring.

## Methods
- `init(frame: CGRect) -> Void` - Initializes the view with a frame.
- `init?(coder: NSCoder) -> Void` - Initializes the view from a coder.
- `initSubviews() -> Void` - Initializes the subviews of the view.
- `drawRingBackground(_ rect: CGRect) -> Void` - Draws the background ring.
- `drawRing(_ rect: CGRect) -> Void` - Draws the progress ring.
- `draw(_ rect: CGRect) -> Void` - Draws the entire view, including the background and progress rings.

## Dependencies
- `Int` - Used for the rating value.
- `UIColor` - Used for the colors of the rings.


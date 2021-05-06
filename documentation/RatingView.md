File: BoxOfficeBuzz/Views/RatingView.swift

# RatingView
## Summary
RatingView is a custom UIView that displays a rating value with a circle view and labels. It can be used to show a rating in a user interface.

## Instance Variables
- `rating`: `Int` - The current rating value.
- `circleView`: `CircleView` - A private circle view that displays the rating.
- `ratingLabel`: `UILabel` - A private label that displays the rating value.
- `percentLabel`: `UILabel` - A private label that displays the percent sign.

## Methods
- `init(frame: CGRect) -> Void` - Initializes the view with a frame.
- `init?(coder: NSCoder) -> Void` - Initializes the view from a coder.
- `initSubviews() -> Void` - Initializes the subviews and sets up the layout.

## Dependencies
- `Int`


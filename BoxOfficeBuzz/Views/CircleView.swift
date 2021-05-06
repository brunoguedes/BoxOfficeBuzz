//
//  Copyright © 2024 BCLGApps. All rights reserved.
//

import UIKit

class CircleView: UIView {

    enum Constants {
        static let padding: CGFloat = .spacing1x
        static let ringWidth: CGFloat = 4
    }

    let progressLayer = CAShapeLayer()

    var rating: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    var darkRingColor: UIColor = .darkGray {
        didSet {
            setNeedsDisplay()
        }
    }

    var brightRingColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }

    func initSubviews() {
        backgroundColor = .clear
    }

    func drawRingBackground(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        let rect = CGRect(x: rect.origin.x + Constants.padding,
                          y: rect.origin.y + Constants.padding,
                          width: rect.width - 2 * Constants.padding,
                          height: rect.height - 2 * Constants.padding)

        context.setLineWidth(4)
        context.setStrokeColor(darkRingColor.cgColor)
        context.strokeEllipse(in: rect)
    }

    func drawRing(_ rect: CGRect) {
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: rect.size.width / 2.0,
                               y: rect.size.height / 2.0),
            radius: (rect.size.width - 2 * Constants.padding) / 2.0,
            startAngle: -CGFloat(.pi / 2.0),
            endAngle: CGFloat(3.0 * .pi * CGFloat(rating) / 200.0) - CGFloat(.pi / 2.0),
            clockwise: true)
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = Constants.ringWidth
        progressLayer.strokeColor = brightRingColor.cgColor
        layer.addSublayer(progressLayer)
    }

    override func draw(_ rect: CGRect) {
        UIColor.ratingViewBackground.setFill()
        let outerPath = UIBezierPath(ovalIn: rect)
        outerPath.fill()
        drawRingBackground(rect)
        drawRing(rect)
    }
}

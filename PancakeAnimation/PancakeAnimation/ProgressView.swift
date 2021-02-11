//
//  ProgressView.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/18/21.
//

import Foundation
import UIKit


class ProgressView: UIView {
    
    private let color: UIColor = UIColor.blue
    private let gradientColor: UIColor = UIColor.lightGray
    
    private let ringWidth: CGFloat = 5

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    private let eskimoImage = UIImage(named: "eskimo")
    private var progressLayer = CAShapeLayer()
    private var backgroundMask = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()
    private let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        setupImageView()
        createAnimation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
        setupImageView()
        createAnimation()
    }
    
    private func setupImageView() {
        
        logoImageView.image = eskimoImage
        logoImageView.tintColor = UIColor.blue
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        logoImageView.frame = self.frame.insetBy(dx: 10, dy: 10)
        self.addSubview(logoImageView)
    }

    private func setupLayers() {
        backgroundMask.lineWidth = 5
        backgroundMask.fillColor = UIColor.blue.cgColor
        backgroundMask.strokeColor = UIColor.white.cgColor
        layer.mask = backgroundMask

        progressLayer.lineWidth = 5
        progressLayer.fillColor = nil
        layer.addSublayer(gradientLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
        
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.15, 0.55, 0.85]
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
    }

    private func createAnimation() {
        
        logoImageView.rotate()

        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startPointAnimation.values = [CGPoint.zero,
                                      CGPoint(x: 1, y: 1),
                                      CGPoint(x: 1, y: 1)]

        startPointAnimation.repeatCount = Float.infinity
        startPointAnimation.duration = 1

        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endPointAnimation.values = [CGPoint(x: 1, y: 1),
                                    CGPoint(x: 0, y: 1),
                                    CGPoint.zero]

        endPointAnimation.repeatCount = Float.infinity
        endPointAnimation.duration = 1

        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    }

    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        backgroundMask.path = circlePath.cgPath

        progressLayer.path = circlePath.cgPath
        progressLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = 0.94
        progressLayer.strokeColor = UIColor.black.cgColor

        gradientLayer.frame = rect
        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
    }
}

extension UIView {
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude

        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

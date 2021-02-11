//
//  CustomActivityIndicator.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/12/21.
//

import Foundation
import UIKit

class CustomActivityIndicatorV1: UIView {
    
    private let dashCircleLayer = CAShapeLayer()
        
    override func draw(_ rect: CGRect) {
        
        let circle = UIBezierPath(ovalIn: rect)
        dashCircleLayer.path = circle.cgPath
        dashCircleLayer.fillColor = nil
        dashCircleLayer.strokeColor = UIColor.blue.cgColor
        dashCircleLayer.lineDashPattern = [2,3]
        dashCircleLayer.lineWidth = 2.0
        layer.addSublayer(dashCircleLayer)
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -0.5
        strokeStartAnimation.toValue = 1.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        
        let strokeGroupAnimation = CAAnimationGroup()
        strokeGroupAnimation.duration = 1.5
        strokeGroupAnimation.repeatDuration = .infinity
        strokeGroupAnimation.animations = [strokeStartAnimation, strokeEndAnimation]
        
        dashCircleLayer.add(strokeGroupAnimation, forKey: nil)
    }
}

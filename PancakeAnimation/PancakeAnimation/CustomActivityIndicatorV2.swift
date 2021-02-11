//
//  CustomActivityIndicatorV2.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/12/21.
//

import Foundation
import UIKit

class CustomActivityIndicatorV2: UIView {
    
    private let shape = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
                
        shape.frame.size = CGSize(width: 2, height: 14)
        shape.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        shape.path = CGPath(ellipseIn: shape.frame, transform: nil)
        shape.fillColor = UIColor.magenta.cgColor
        
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 20
        let fullCircle = CGFloat.pi/2
        let angle = fullCircle/CGFloat(replicator.instanceCount)

        replicator.instanceTransform = CATransform3DMakeRotation(4*angle, 0, 0, 1)
        replicator.bounds.size = CGSize(width: rect.height * .pi,
                                        height: rect.height)
        replicator.addSublayer(shape)
        replicator.instanceDelay = 0.02
        
        layer.addSublayer(replicator)
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0.0
        rotation.toValue = 1.0
        rotation.repeatDuration = .infinity
        
        replicator.add(rotation, forKey: nil)
        
//        let rotation = CABasicAnimation(keyPath: "instanceTransform.rotation")
//        rotation.fromValue = 0
//        rotation.toValue = 1
//        rotation.duration = 3
//        //rotation.beginTime = CACurrentMediaTime() + 0.33
//        rotation.repeatCount = .infinity
//        rotation.autoreverses = true
//        rotation.isRemovedOnCompletion = false
//        rotation.fillMode = .forwards
//        rotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        replicator.add(rotation, forKey: nil)
    }
}

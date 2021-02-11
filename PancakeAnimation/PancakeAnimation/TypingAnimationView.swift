//
//  TypingAnimationView.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/13/21.
//

import Foundation
import UIKit

class TypingAnimationView: UIView {
    
    private var ovalLayer = CAShapeLayer()
    private var dotLayer = CAShapeLayer()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 50))
    }
   
    override func draw(_ rect: CGRect) {
        drawOvalLayer(in: rect)
        drawAndAnimateDots(in: rect)
    }
    
    private func drawOvalLayer(in rect: CGRect) {
        
        let heightInset: CGFloat = 8
        let widthInset: CGFloat = 18
        
        let ovalPath = UIBezierPath()
        
        ovalPath.move(to: CGPoint(x: rect.origin.x+widthInset, y: heightInset))
        ovalPath.addLine(to: CGPoint(x: rect.width-widthInset, y: heightInset))
        
        ovalPath.addArc(withCenter: CGPoint(x: rect.width - widthInset, y: 23),
                                            radius: 15,
                                            startAngle: 3 * .pi/2,
                                            endAngle: .pi/2,
                                            clockwise: true)
        
        ovalPath.addLine(to: CGPoint(x: rect.origin.x+widthInset, y: 38))

        ovalPath.addArc(withCenter: CGPoint(x: rect.origin.x + widthInset, y: 23),
                                            radius: 15,
                                            startAngle: .pi/2,
                                            endAngle: 3 * .pi/2 ,
                                            clockwise: true)
        
        ovalLayer.fillColor = UIColor.lightGray.cgColor
        ovalLayer.path = ovalPath.cgPath
        layer.addSublayer(ovalLayer)
    }
    
    private func drawAndAnimateDots(in rect: CGRect) {
        
        let rectForDot = CGRect(x: 0, y: 0, width: 14, height: 14)
        let ovalDotPath = UIBezierPath(ovalIn: rectForDot)
        dotLayer.path = ovalDotPath.cgPath
        dotLayer.frame = rectForDot
        dotLayer.position = CGPoint(x: 20, y: rect.height/2.2)
        dotLayer.fillColor = UIColor.gray.cgColor
        
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 3
        replicator.instanceTransform = CATransform3DMakeTranslation(dotLayer.frame.width+6, 0.0, 0.0)
        replicator.instanceDelay = 0.5
        replicator.addSublayer(dotLayer)
        
        ovalLayer.addSublayer(replicator)
        
        let positionAnimation = CABasicAnimation(keyPath: "position.y")
        positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: 20,
                                                             y: rect.height/2.2+6))
        positionAnimation.duration = 0.8
        positionAnimation.autoreverses = true
        positionAnimation.repeatDuration = .infinity
        dotLayer.add(positionAnimation, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

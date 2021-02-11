//
//  DonutProgressView.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/11/21.
//

import Foundation
import UIKit

class DonutProgressView: UIView {
    
    private let circleShapeLayer: CAShapeLayer = CAShapeLayer()
    private let pinkSouceShapeLayer: CAShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circleShapeLayer.fillColor = nil
        circleShapeLayer.strokeColor = #colorLiteral(red: 0.7529411765, green: 0.6588235294, blue: 0.5137254902, alpha: 1)
        circleShapeLayer.lineWidth = bounds.width - 70
        circleShapeLayer.path = UIBezierPath(ovalIn: frame).cgPath
        
        pinkSouceShapeLayer.fillColor = nil
        pinkSouceShapeLayer.strokeColor = UIColor.systemPink.cgColor
        pinkSouceShapeLayer.lineWidth = bounds.width - 70
        pinkSouceShapeLayer.path = UIBezierPath(ovalIn: frame).cgPath
        
        layer.addSublayer(pinkSouceShapeLayer)
        layer.addSublayer(circleShapeLayer)

        let fillWithPinkColorAnimation = CABasicAnimation(keyPath: "strokeStart")
        fillWithPinkColorAnimation.fromValue = 0
        fillWithPinkColorAnimation.toValue = 1
        fillWithPinkColorAnimation.duration = 2
        fillWithPinkColorAnimation.isRemovedOnCompletion = false
        fillWithPinkColorAnimation.fillMode = .forwards
        
        circleShapeLayer.add(fillWithPinkColorAnimation, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

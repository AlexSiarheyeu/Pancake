//
//  TrainReplicatorView.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/12/21.
//

import Foundation
import UIKit

class TrainReplicatorView: UIView {
    
    private let trainLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let train = UIImage(named: "train")!
        trainLayer.contents = train.cgImage
        trainLayer.bounds = CGRect(x: 0.0,
                                   y: 0.0,
                                   width: train.size.width/3,
                                   height: train.size.height/3)
        
        trainLayer.position = CGPoint(x: -55, y: 60)
       
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 4
        replicator.instanceTransform = CATransform3DMakeTranslation(train.size.width/2.9, 0.0, 0.0)
        replicator.addSublayer(trainLayer)
        layer.addSublayer(trainLayer)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 0
        animation.toValue = 1
        //animation.duration =
        animation.repeatDuration = .infinity
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = .forwards
        trainLayer.add(animation, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

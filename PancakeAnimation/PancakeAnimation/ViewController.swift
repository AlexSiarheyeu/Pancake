//
//  ViewController.swift
//  PancakeAnimation
//
//  Created by Alexey Sergeev on 1/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bigDonutImageView: UIImageView!
    @IBOutlet weak var smallDonutImageView: UIImageView!
    @IBOutlet weak var middleDonutImageView: UIImageView!
    
    private var donutProgressView: DonutProgressView!
    private var customAcivityIndicatorV1: CustomActivityIndicatorV1!
    private var customAcivityIndicatorV2: CustomActivityIndicatorV2!
    private var trainReplicatorView: TrainReplicatorView!
    private var typingAnimationView: TypingAnimationView!
    private var progressView: ProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 1
        
//        let rect = CGRect(x: 0,
//                          y: 0,
//                          width: 150,
//                          height: 150)
//
//        donutProgressView = DonutProgressView(frame: rect)
//        view.addSubview(donutProgressView)
//        donutProgressView.center = view.center
        
        //MARK: - 2
        
//        let rect = CGRect(x: 0,
//                          y: 0,
//                          width: 150,
//                          height: 150)
//        customAcivityIndicatorV1 = CustomActivityIndicatorV1(frame: rect)
//        view.addSubview(customAcivityIndicatorV1)
//        customAcivityIndicatorV1.center = view.center
        
        //MARK: - 3
        
//        customAcivityIndicatorV2 = CustomActivityIndicatorV2()
//        customAcivityIndicatorV2.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(customAcivityIndicatorV2)
//        NSLayoutConstraint.activate([
//            customAcivityIndicatorV2.widthAnchor.constraint(equalToConstant: 20),
//            customAcivityIndicatorV2.heightAnchor.constraint(equalToConstant: 20),
//            customAcivityIndicatorV2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            customAcivityIndicatorV2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
        
        //MARK: - 4
        
//        trainReplicatorView = TrainReplicatorView()
//        view.addSubview(trainReplicatorView)
        
        //MARK: - 5
        
//        typingAnimationView = TypingAnimationView()
//        view.addSubview(typingAnimationView)
//        typingAnimationView.center = view.center
        
        
        //MARK: - 5
        
        progressView = ProgressView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    
        progressView.center = view.center
        view.addSubview(progressView)
        progressView.progress = 0.33
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //animatePositionYDonut(on: smallDonutImageView.layer)
        //animatePositionYDonut(on: middleDonutImageView.layer)
        //animatePositionYDonut(on: bigDonutImageView.layer)
    }
    
    func animatePositionYDonut(on layer: CALayer) {
        
        let speed = 20.0 / Double(view.layer.frame.size.height)
        let duration: TimeInterval = Double(
        view.layer.frame.size.height - layer.frame.origin.x) * speed
        
        let positionAnimation = CABasicAnimation(keyPath: "position.y")
        positionAnimation.duration = duration
        positionAnimation.toValue = self.view.bounds.height + layer.bounds.height
        
        positionAnimation.setValue("donut", forKey: "name")
        positionAnimation.setValue(layer, forKey: "layer")
        
        positionAnimation.delegate = self
        
        layer.add(positionAnimation, forKey: nil)
        animateDonutWithRotation(with: duration, on: layer)
    }
    
    func animateDonutWithRotation(with timeInterval: Double, on layer: CALayer) {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.duration = timeInterval
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue =  3 * Double.pi / 2
        layer.add(rotationAnimation, forKey: nil)
    }
}

extension ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        guard let name = anim.value(forKey: "name") as? String else { return }
        
        if name == "donut" {
            
            let layer = anim.value(forKey: "layer") as! CALayer
            layer.position.y = -layer.bounds.height/2
            
            animatePositionYDonut(on: layer)
            
        }
    }
}

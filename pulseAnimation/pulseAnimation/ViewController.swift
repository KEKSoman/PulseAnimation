//
//  ViewController.swift
//  pulseAnimation
//
//  Created by Евгений колесников on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pulseView: UIView!
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var blsckView: UIView!
    @IBOutlet weak var yellowView: UIView!
    
    let animator = UIViewPropertyAnimator(duration: 2.0, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulseView.backgroundColor = .red
        pulseButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        setViews()
//       animation()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
//        animator.startAnimation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard
            let pulseView = pulseView,
            let greenView = greenView,
            let blueView = blueView,
            let blsckView = blsckView,
            let yellowView = yellowView
        else { return}
        [greenView, blueView, blsckView, yellowView].forEach({ item in
            item.alpha = 1
            item.layoutIfNeeded()
        })
        
        [pulseView ,greenView, blueView, blsckView, yellowView].forEach({ item in
            item.clipsToBounds = false
            
            item.layer.cornerRadius = item.frame.width / 2
        })
    }
    func setViews() {
        guard
            let pulseView = pulseView,
            let greenView = greenView,
            let blueView = blueView,
            let blsckView = blsckView,
            let yellowView = yellowView
        else { return}
        
        [pulseView, greenView, blueView, blsckView, yellowView].forEach({ item in
            item.backgroundColor = .clear
            item.layer.borderWidth = 2
        })
        pulseView.layer.borderColor = UIColor.red.cgColor
        yellowView.layer.borderColor = UIColor.yellow.cgColor
        blueView.layer.borderColor = UIColor.blue.cgColor
        blsckView.layer.borderColor = UIColor.black.cgColor
        greenView.layer.borderColor = UIColor.green.cgColor
    }
    
    func animation() {
        UIView.animate(withDuration: 4, delay: 0.0, options: .repeat, animations: {
            self.yellowView.transform = CGAffineTransform(scaleX: 6, y: 6)
            self.yellowView.alpha = 0
        })
        UIView.animate(withDuration: 4, delay: 1.0, options: .repeat, animations: {
            self.blsckView.transform = CGAffineTransform(scaleX: 6, y: 6)
            self.blsckView.alpha = 0
        })
        UIView.animate(withDuration: 4, delay: 2.0, options: .repeat, animations: {
            self.blueView.transform = CGAffineTransform(scaleX: 6, y: 6)
            self.blueView.alpha = 0
        })
        UIView.animate(withDuration: 4, delay: 3.0, options: .repeat, animations: {
            self.greenView.transform = CGAffineTransform(scaleX: 6, y: 6)
            self.greenView.alpha = 0
        })
        
        animator.startAnimation()
    }
    @objc func startAnimation() {
        UIView.animate(withDuration: 2.0, animations: {[self] in
            pulseView.animateBorderColor(toColor: .cyan, duration: 2.0)
            yellowView.animateBorderColor(toColor: .purple, duration: 2.0)
            blueView.animateBorderColor(toColor: .magenta, duration: 2.0)
            blsckView.animateBorderColor(toColor: .brown, duration: 2.0)
            greenView.animateBorderColor(toColor: .gray, duration: 2.0)
        })
       
    }
    @IBAction func restoreColor(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {[self] in
            pulseView.animateBorderColor(toColor: .red, duration: 2.0)
            yellowView.animateBorderColor(toColor: .yellow, duration: 2.0)
            blueView.animateBorderColor(toColor: .blue, duration: 2.0)
            blsckView.animateBorderColor(toColor: .black, duration: 2.0)
            greenView.animateBorderColor(toColor: .green, duration: 2.0)
        })
       
    }
}
extension UIView {
  func animateBorderColor(toColor: UIColor, duration: Double) {
    let animation = CABasicAnimation(keyPath: "borderColor")
    animation.fromValue = layer.borderColor
    animation.toValue = toColor.cgColor
    animation.duration = duration
    layer.add(animation, forKey: "borderColor")
    layer.borderColor = toColor.cgColor
  }
}

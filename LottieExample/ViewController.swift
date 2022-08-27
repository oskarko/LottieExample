//
//  ViewController.swift
//  LottieExample
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Lottie
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startLottieButton: UIButton!


    @IBAction func startLottieButtonTapped(_ sender: UIButton) {
        showSuccess()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeSuccess()
        }
    }
    
}

extension UIViewController {
    
    func showSuccess() {
        let viewLoading = UIView.init(frame: self.view.bounds)
        viewLoading.tag = 81

        let spinning = AnimationView(name: "success")
        spinning.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        spinning.center = viewLoading.center
        spinning.loopMode = .playOnce
        spinning.animationSpeed = 1

        viewLoading.addSubview(spinning)
        self.view.addSubview(viewLoading)

        spinning.play()
    }

    func removeSuccess() {
        if let viewLoading = self.view.viewWithTag(81) {
            UIView.animate(withDuration: 0.25, animations: {
                viewLoading.alpha = 0.0
            }, completion: { (_) in
                viewLoading.removeFromSuperview()
            })
        }
    }
}

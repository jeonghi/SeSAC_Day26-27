//
//  UIView+Extension.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/2/24.
//

import UIKit
import Then

extension UIView {
  
  func applyGradient() {
    
    let gradientLayer: CAGradientLayer = .init()
    gradientLayer.frame = self.bounds
    
    let colors: [CGColor] = [
      UIColor.clear.cgColor,
      UIColor.clear.cgColor,
      UIColor.clear.cgColor,
      UIColor.black.cgColor
    ]
    
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer.colors = colors
    gradientLayer.locations = [0.1, 0.2, 0.8]

    self.layer.addSublayer(gradientLayer)
  }
  
  func wrapToVC() -> UIViewController {
    UIViewController().then {
      $0.view = self
    }
  }
}

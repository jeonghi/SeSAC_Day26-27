//
//  UIView+Extension.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/2/24.
//

import UIKit
import Then

extension UIView {
  func wrapToVC() -> UIViewController {
    UIViewController().then {
      $0.view = self
    }
  }
}

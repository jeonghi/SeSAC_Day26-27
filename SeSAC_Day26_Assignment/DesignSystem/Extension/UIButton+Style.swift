//
//  UIButton+Style.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit

extension UIButton {
  func applyStyle(_ style: Style.Component.Button, isEnabled: Bool) {
    self.isEnabled = isEnabled
    if isEnabled {
      // 활성화된 상태의 스타일
      self.tintColor = style.activeTintColor
      self.setTitleColor(style.activeTintColor, for: .normal)
      self.backgroundColor = style.activeBackgroundColor
      
    } else {
      // 비활성화된 상태의 스타일
      self.tintColor = style.inactiveTintColor
      self.setTitleColor(style.inactiveTintColor, for: .normal)
      self.backgroundColor = style.inactiveBackgroundColor
    }
    self.layer.cornerRadius = style.radius
    self.titleLabel?.font = style.font
  }
}

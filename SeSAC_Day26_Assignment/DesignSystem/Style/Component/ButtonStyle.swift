//
//  ButtonStyle.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit

struct ButtonStyle {
  
  let activeTintColor: UIColor
  let activeBackgroundColor: UIColor
  let inactiveTintColor: UIColor
  let inactiveBackgroundColor: UIColor
  let font: UIFont
  let radius: CGFloat
  
  static let primary = ButtonStyle(
    activeTintColor: ColorStyle.tintColor,
    activeBackgroundColor: ColorStyle.pointColor,
    inactiveTintColor: ColorStyle.inactiveTintColor,
    inactiveBackgroundColor: ColorStyle.inactiveBackgroundColor,
    font: FontStyle.systemFont16,
    radius: 6.0
  )
}
